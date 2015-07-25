FROM ubuntu:14.04
MAINTAINER dev@jpillora.com
#apt installs
RUN apt-get install -y curl
#influxdb install
ENV INFLUXDB_VERSION 0.9.2
RUN curl -s -o /tmp/influxdb_latest_amd64.deb https://s3.amazonaws.com/influxdb/influxdb_${INFLUXDB_VERSION}_amd64.deb && \
  dpkg -i /tmp/influxdb_latest_amd64.deb && \
  rm /tmp/influxdb_latest_amd64.deb && \
  rm -rf /var/lib/apt/lists/*
#default data directory
RUN mkdir /root/.influxdb
#ports ADMIN, API
EXPOSE 8083   8086

ENTRYPOINT ["/opt/influxdb/influxd"]
