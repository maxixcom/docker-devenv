.PHONY: config

config:
	$(foreach i, \
	    $(wildcard $(CURDIR)/config/*.yml.template), \
	    cat $i | sed "s#{{AX_DOMAIN_BASE}}#$(AX_DOMAIN_BASE)#" \
		> $(subst .template,,$i); \
	)
	install -m 0777 -d $(CURDIR)/data

clean-config:
	rm -rf $(CURDIR)/config/*.yml

clean-data:
	rm -rf $(CURDIR)/data

clean-docker-rmi:
