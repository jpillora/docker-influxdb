FROM ubuntu:14.04
MAINTAINER dev@jpillora.com
#apt installs
RUN apt-get install -y curl
#influxdb install
ENV INFLUXDB_VERSION 0.9.4.2
RUN curl -s -o /tmp/influxdb_amd64.deb https://s3.amazonaws.com/influxdb/influxdb_${INFLUXDB_VERSION}_amd64.deb && \
  dpkg -i /tmp/influxdb_amd64.deb && \
  rm /tmp/influxdb_amd64.deb && \
  rm -rf /var/lib/apt/lists/*
#default single-host config
ADD default-config.toml /etc/influxdb/config.toml
#ports ADMIN API RAFT
EXPOSE 8083 8086 8088
#allow force -config param, though allow image user to provide others
ENTRYPOINT ["/opt/influxdb/influxd","run","-config","/etc/influxdb/config.toml"]
