
config:
	install -m 0755 -d $(CURDIR)/logs/server
	install -m 0755 -d $(CURDIR)/logs/manager
	touch $(CURDIR)/logs/supervisord.log

clean-config:

clean-data:
	rm -rf $(CURDIR)/logs

clean-docker-rmi:
	$(DOCKER) rmi $(ID)_wowza || echo -e "\033[0;31mNo such resource\033[0m"