SHELL := bash

ROOT := $(shell pwd)

DOCKER-IMAGE := libfyaml-bindings-lua

build: lyaml libfyaml

test: lyaml libfyaml build
	docker run \
	    --rm \
	    --interactive \
	    --tty \
	    --volume=$(ROOT):/host \
	    --workdir=/host \
	    $(DOCKER-IMAGE) \
	    make test-lyaml

shell: build
	docker run \
	    --rm \
	    --interactive \
	    --tty \
	    --volume=$(ROOT):/host \
	    --workdir=/host \
	    $(DOCKER-IMAGE) \
	    bash

test-lyaml:
	( \
	    cd lyaml && \
	    specl -vfreport --coverage spec/*_spec.yaml \
	)

docker-build:
	docker build --tag=$(DOCKER-IMAGE) .

lyaml:
	git clone git@github.com:gvvaughan/lyaml $@

libfyaml:
	git clone --branch=master git@github.com:pantoniou/libfyaml $@
