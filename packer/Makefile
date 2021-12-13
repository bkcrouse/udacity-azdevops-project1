.PHONY: check-env all install pre_build build post_build login create-rg check-rg
.EXPORT_ALL_VARIABLES:

SHELL := /bin/bash
SSH_INTERFACE ?= public_dns
SECURITY_GROUP_CIDR := $(shell curl -sSL 'https://api.ipify.org')/32
PACKER_LOG ?= 1
PACKER_LOG_PATH ?= packer.log
AZ_RESOURCE_GROUP ?= packer-rg
AZ_SUBSCRIPTION_ID ?= 
AZ_CLIENT_SECRET ?=
AZ_TENANT_ID ?=
AZ_CLIENT_ID ?=
AZ_LOCATION ?= "East US"
AZ_TAGS ?= 'environment=udacity'
BUILDER_IMAGE_ID ?= udacity-azdevops
BUILDER_ROOT_DIR := $(shell pwd)
BUILDER_TEMPLATE_DIR := $(BUILDER_ROOT_DIR)/templates
BUILDER_TEMPLATE_NAME ?= server.json
BUILDER_IMAGE_PUBLISHER ?= Canonical
BUILDER_IMAGE_OFFER ?= UbuntuServer
BUILDER_IMAGE_SKU ?= 18.04-LTS

check-env:
	@test $${AZ_RESOURCE_GROUP}
	@test $${AZ_SUBSCRIPTION_ID}
	@test $${AZ_CLIENT_SECRET}
	@test $${AZ_CLIENT_ID}
	@test "$${AZ_LOCATION}"
	@test "$${AZ_TAGS}"
	@test "$${BUILDER_IMAGE_OFFER}"
	@test "$${BUILDER_IMAGE_PUBLISHER}"
	@test "$${BUILDER_IMAGE_SKU}"


login: check-env
	@az login
	@az account set --subscription $(AZ_SUBSCRIPTION_ID)

check-rg: check-env
	@-az group show --resource-group  "$(AZ_RESOURCE_GROUP)" --subscription $(AZ_SUBSCRIPTION_ID)

create-rg: check-rg
	@-az group create --resource-group "$(AZ_RESOURCE_GROUP)" --subscription $(AZ_SUBSCRIPTION_ID) --location $(AZ_LOCATION) --tags $(AZ_TAGS)

all: build

pre_build: create-rg
	bash -eo pipefail ./build/pre_build.sh

build: pre_build
	bash ./build/build.sh

post_build:
	bash -eo pipefail ./build/post_build.sh

clean:
	-az group delete --resource-group "$(AZ_RESOURCE_GROUP)" --subscription $(AZ_SUBSCRIPTION_ID)