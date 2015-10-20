docker run \
	-d \
	--name influxdb \
	-p 8083:8083  -p 8086:8086  -p 8088:8088 \
	-v /opt/influxdb/:/var/opt/influxdb/ \
	quay.io/jpillora/influxdb:latest
