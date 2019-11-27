# docker-fluentd

* Fluentd on Ubuntu configured for shipping to Elastic

## Versions
- Ubuntu linux
- Fluentd v1.7.4-debian-2.0

## Usage

`docker run -p 9880:9880 -e ELASTIC_HOST=elastic-host -e ELASTIC_PORT=9200 --rm -it chrisgarrett/fluentd:1.7.3-2019.10.10`


## Credits
