
config: $(foreach mod, $(MODULES), config-$(mod) )
config-%:
	$(MAKE) -C docker/$(patsubst config-%,%, $@) config

clean-config: $(foreach mod, $(MODULES), clean-config-$(mod) )
clean-config-%:
	$(MAKE) -C docker/$(patsubst clean-config-%,%, $@) clean-config

clean-data: $(foreach mod, $(MODULES), clean-data-$(mod) )
clean-data-%:
	$(MAKE) -C docker/$(patsubst clean-data-%,%, $@) clean-data

clean-docker-rmi: $(foreach mod, $(MODULES), clean-docker-rmi-$(mod) )
clean-docker-rmi-%:
	$(MAKE) -C docker/$(patsubst clean-docker-rmi-%,%, $@) clean-docker-rmi

clean-module: $(foreach mod, $(MODULES), clean-config-$(mod) clean-data-$(mod) )