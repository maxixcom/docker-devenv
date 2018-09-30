include $(CURDIR)/../../.env

config:
	cat $(CURDIR)/ax.ini.template \
	| sed "s#{{AX_TZ}}#$(AX_TZ)#" \
	> $(CURDIR)/ax.ini
	install -d $(CURDIR)/log
	touch $(CURDIR)/log/fpm-php.www.log \
	&& chmod 777 $(CURDIR)/log/fpm-php.www.log

clean-config:
	rm -rf $(CURDIR)/ax.ini

clean-data:
	rm -rf $(CURDIR)/log

clean-docker-rmi:
	$(DOCKER) rmi $(ID)_php || echo -e "\033[0;31mNo such resource\033[0m"