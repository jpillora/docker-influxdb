# docker-influxdb

An InfluxDB 0.9.x Docker image

## Usage

```
$ docker pull quay.io/jpillora/influxdb:latest
# create your config.toml (see below)
$ nano /opt/config.toml
# prepare your data directory
$ mkdir -p /opt/influxdb/
# run it in the background
$ docker run \
	-d \
	--name influxdb \
	-p 8083:8083  -p 8086:8086  -p 8088:8088 \
	-v /opt/influxdb/:/var/opt/influxdb/ \
	quay.io/jpillora/influxdb:latest
```

**Single-host**

Use the `docker run` command above

**Clustered**

You'll need to provide `-hostname` (cluster reachable address) and `-join` (one of the other nodes) program arguments:

```
$ docker run \
	-d \
	--name influxdb-2 \
	-p 8083:8083  -p 8086:8086  -p 8088:8088 \
	-v /opt/influxdb/:/var/opt/influxdb/ \
	quay.io/jpillora/influxdb:latest \
		-hostname influxdb-2.my.company \
		-join influxdb-1.my.company:8088
```

**Overriding `config.toml`**

The current config is sourced from [config.sample.toml](https://raw.githubusercontent.com/influxdb/influxdb/0.9.4/etc/config.sample.toml). You can override this config by creating a new `/path/to/config.toml` file and mounting over the default config:

```
	-v /path/to/config.toml:/etc/influxdb/config.toml \
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
