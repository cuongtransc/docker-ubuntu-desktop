CONTAINER_REGISTRY_URL=cuongtransc

IMAGE_NAME=ubuntu
IMAGE_VERSION=xfce-vnc-20.04

all: build

build:
	docker build --tag=${CONTAINER_REGISTRY_URL}/${IMAGE_NAME}:${IMAGE_VERSION} .

push:
	docker push ${CONTAINER_REGISTRY_URL}/${IMAGE_NAME}:${IMAGE_VERSION}
