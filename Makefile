.PHONY: sources

-include .env

all:

-include .config
export ID?=unknown0
export DOCKER?=docker
export DOCKER_COMPOSE?=docker-compose
DOMAIN?=localhost.localdomain
CNAME?=""
AX_TZ_LOCAL?=/etc/localtime
env:
	cat $(CURDIR)/env.template \
	| sed "s#{{CURDIR}}#$(CURDIR)#" \
	| sed "s#{{ID}}#$(ID)#" \
	| sed "s#{{DOMAIN}}#$(DOMAIN)#" \
	| sed "s#{{DOMAIN_CNAME}}#$(CNAME)#" \
	| sed "s#{{AX_TZ_LOCAL}}#$(AX_TZ_LOCAL)#" \
	> $(CURDIR)/.env

sources:
	install -m 0755 -d $(CURDIR)/sources/

create: sources config create-docker

clean: stop clean-docker

clean-all: clean clean-module clean-docker-rmi

start:
	$(DOCKER_COMPOSE) start

stop:
	$(DOCKER_COMPOSE) stop

status:
	$(DOCKER_COMPOSE) ps

## docker ##########################################################################
create-docker:
	$(DOCKER) network create $(DOCKER_EXTERNAL_NETWORK)
	$(DOCKER_COMPOSE) create

clean-docker:
	$(DOCKER_COMPOSE) rm --force
	$(DOCKER) network rm $(DOCKER_EXTERNAL_NETWORK) || echo -e "\033[0;31mNo such resource\033[0m"

include $(CURDIR)/Modules.mk
include $(CURDIR)/Rules.mk

