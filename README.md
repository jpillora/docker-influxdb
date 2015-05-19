# docker-influxdb

An InfluxDB 0.9 Docker image

## Usage

```
$ docker pull quay.io/jpillora/influxdb:latest
$ mkdir -p /opt/influxdb/
$ docker run \
	--rm \
	--name influxdb \
	-p 8083:8083 \
	-p 8086:8086 \
	-v /opt/influxdb/:/data/ \
	quay.io/jpillora/influxdb:latest \
		--hostname <peer-reachable-host/ip> \
		--config /etc/influxdb/config.toml \
		--join http://<another-peer-reachable-host/ip>:8086
```

If you don't want to use the default `config.toml`, you can map your own config with `-v my-config.toml:/etc/influxdb/config.toml`

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