include $(CURDIR)/../../.env

config:
	$(foreach i, \
	    $(wildcard $(CURDIR)/nginx/*.conf.template), \
	    cat $i | sed "s#{{AX_DOMAIN_BASE}}#$(AX_DOMAIN_BASE)#" \
		> $(subst .template,,$i); \
	)
	install -m 0755 -d $(CURDIR)/log

clean-config:
	rm -rf $(CURDIR)/nginx/*.conf

clean-data:
	rm -rf $(CURDIR)/log

clean-docker-rmi:
