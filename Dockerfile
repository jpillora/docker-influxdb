FROM ubuntu:14.04
MAINTAINER dev@jpillora.com
#apt installs
RUN apt-get update
RUN apt-get install -y curl
#influxdb install
ENV INFLUXDB_VERSION 0.9.0-rc29
RUN curl -s -o /tmp/influxdb_latest_amd64.deb https://s3.amazonaws.com/influxdb/influxdb_${INFLUXDB_VERSION}_amd64.deb && \
  dpkg -i /tmp/influxdb_latest_amd64.deb && \
  rm /tmp/influxdb_latest_amd64.deb && \
  rm -rf /var/lib/apt/lists/*
#add config which is overridable
RUN mkdir /data
ADD config.toml /etc/influxdb/config.toml
VOLUME ["/data"]
#ports ADMIN, API
EXPOSE 8083   8086

ENTRYPOINT ["/opt/influxdb/influxd"]