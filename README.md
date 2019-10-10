# docker-fluentd

* Fluend on Apline configured for shipping to Elastic

## Versions
- Alpine linux
- Fluentd v1.7.3-1.0

## Usage

`docker run -p 9880:9880 -e ELASTIC_HOST=elastic-host -e ELASTIC_PORT=9200 --rm -it chrisgarrett/fluentd:1.7.3-2019.10.10`


## Credits
