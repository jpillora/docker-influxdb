docker run \
	-d \
	--name influxdb \
	-p 8083:8083  -p 8086:8086  -p 8088:8088 \
	-v /opt/influxdb/:/root/.influxdb/ \
	-v /opt/influxdb.toml:/etc/influxdb/config.toml \
	quay.io/jpillora/influxdb:latest
