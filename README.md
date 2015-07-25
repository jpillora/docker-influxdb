# docker-influxdb

An InfluxDB 0.9.2 Docker image

## Usage

```
$ docker pull quay.io/jpillora/influxdb:latest
$ mkdir -p /opt/influxdb/
$ docker run \
	--rm \
	--name influxdb \
	-p 8083:8083 \
	-p 8086:8086 \
	-v /opt/influxdb/:/root/.influxdb/ \
	# -v my-config.toml:/etc/influxdb/config.toml \
	quay.io/jpillora/influxdb:latest \
		--hostname <peer-reachable-host/ip> \
		# --config /etc/influxdb/config.toml \
		# --join http://<another-peer-reachable-host/ip>:8086
```

**Note: Before use, remove unused commented parameters**

See default configuration:

``` toml
reporting-disabled = false

[meta]
  dir = "/root/.influxdb/meta"
  hostname = "localhost"
  bind-address = ":8088"
  retention-autocreate = true
  election-timeout = "1s"
  heartbeat-timeout = "1s"
  leader-lease-timeout = "500ms"
  commit-timeout = "50ms"

[data]
  dir = "/root/.influxdb/root"
  max-wal-size = 104857600
  wal-flush-interval = "10m0s"
  wal-partition-flush-delay = "2s"
  retention-auto-create = true
  retention-check-enabled = true
  retention-check-period = "10m0s"
  retention-create-period = "45m0s"

[cluster]
  shard-writer-timeout = "5s"

[retention]
  enabled = true
  check-interval = "10m0s"

[shard-precreation]
  enabled = true
  check-interval = "10m0s"
  advance-period = "30m0s"

[admin]
  enabled = true
  bind-address = ":8083"

[http]
  enabled = true
  bind-address = ":8086"
  auth-enabled = false
  log-enabled = true
  write-tracing = false
  pprof-enabled = false

[[graphite]]
  bind-address = ":2003"
  database = "graphite"
  enabled = false
  protocol = "tcp"
  batch-size = 0
  batch-timeout = "0"
  consistency-level = "one"
  separator = "."

[collectd]
  enabled = false
  bind-address = ":25826"
  database = "collectd"
  retention-policy = ""
  batch-size = 5000
  batch-timeout = "10s"
  typesdb = "/usr/share/collectd/types.db"

[opentsdb]
  enabled = false
  bind-address = ":4242"
  database = "opentsdb"
  retention-policy = ""
  consistency-level = "one"

[udp]
  enabled = false
  bind-address = ""
  database = ""
  batch-size = 0
  batch-timeout = "0"

[monitoring]
  enabled = false
  write-interval = "1m0s"

[continuous_queries]
  enabled = true
  recompute-previous-n = 2
  recompute-no-older-than = "10m0s"
  compute-runs-per-interval = 10
  compute-no-more-than = "2m0s"

[hinted-handoff]
  enabled = true
  dir = "/root/.influxdb/hh"
  max-size = 1073741824
  max-age = "168h0m0s"
  retry-rate-limit = 0
  retry-interval = "1s"
```

#### MIT License

Copyright &copy; 2015 Jaime Pillora &lt;dev@jpillora.com&gt;

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
