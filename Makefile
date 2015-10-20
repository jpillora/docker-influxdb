.PHONY: testbuild
testbuild:
	@echo "building..."
	@docker build --rm -t jpillora/influxdb:test .
testrun:
	@echo "running..."
	@docker run \
		--name influxdb \
		-it --rm \
		-p 8083:8083  -p 8086:8086  -p 8088:8088 \
		-v /opt/influxdb/:/data/ \
		jpillora/influxdb:test
