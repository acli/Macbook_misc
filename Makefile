install: /usr/local/sbin/fanspeedd \
	/usr/local/sbin/fanspeed \
	/usr/local/sbin/hibernate \
	/usr/local/sbin/run_makewhatis \
	/usr/local/sbin/sleepnow \

/usr/local/sbin/%: %
	install -m 755 -o 0 -g 0 $< $@
