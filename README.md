# docker-fluentd

* Fluend on Apline configured for shipping to Elastic

## Versions
- Alpine linux
- Fluentd 1.7.4-1.0
### Plugins
- fluent-plugin-elasticsearch 3.7.0
- fluent-plugin-record-modifier 2.0.1
- fluent-plugin-s3 1.2.1

## Usage

`docker run -p 9880:9880 -e ELASTIC_HOST=elastic-host -e ELASTIC_PORT=9200 --rm -it chrisgarrett/fluentd:1.7.4-1.0`


## Credits
