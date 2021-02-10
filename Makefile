DOCKER_REPO ?= quay.io/jmesnil/
IMAGE ?= postgresql-driver-jboss-module
TAG ?= latest
PGSQL_DRIVER_VERSION=42.2.18
.PHONY: image push help

.DEFAULT_GOAL := help


## image                 Create the Docker image of the operator
image:
	docker build -t "${DOCKER_REPO}$(IMAGE):$(TAG)" . --build-arg PGSQL_DRIVER_VERSION=${PGSQL_DRIVER_VERSION}
	
## push                  Push Docker image to the Quay.io repository.
push: image
	docker push "${DOCKER_REPO}$(IMAGE):$(TAG)"

help : Makefile
	@sed -n 's/^##//p' $<