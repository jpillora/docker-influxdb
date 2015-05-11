.PHONY: build
build:
	@echo "building..."
	@docker build --rm -t jpillora/influxdb:0.1.0 .
run:
	@echo "running..."
	@docker run \
		--name influxdb \
		-it --rm \
		-p 8083:8083 -p 8086:8086 \
		-v /opt/influxdb/:/data/ \
		jpillora/influxdb:0.1.0