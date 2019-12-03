export FLUENTD_VERSION=1.7.4-1.0
export FLUENTD_PLUGIN_ELASTIC=3.7.0
export FLUENTD_PLUGIN_RECORDMODIFIER=2.0.1
export FLUENTD_PLUGIN_S3=1.2.1
export DOCKERIZE_VERSION=v0.6.1
export IMAGE_VERSION=${FLUENTD_VERSION}
export IMAGE_NAME=chrisgarrett/fluentd

all: build

prep:
	envsubst < ./templates/Dockerfile.template > Dockerfile
	envsubst < ./templates/README.md.template > README.md
	envsubst < ./templates/fluent.conf.template > fluent.conf

build: prep
	docker build --no-cache --rm=true -t ${IMAGE_NAME}:${IMAGE_VERSION} .

run:
	docker run -p 9880:9880 -e ELASTIC_HOST=elastic-host -e ELASTIC_PORT=9200 --rm -it ${IMAGE_NAME}:${IMAGE_VERSION}

bash:
	docker run --rm -it -v `pwd`/templates:/fluentd/templates ${IMAGE_NAME}:${IMAGE_VERSION} sh
