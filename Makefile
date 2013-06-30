install: /usr/local/sbin/fanspeedd

/usr/local/sbin/fanspeedd: fanspeedd

/usr/local/sbin/%: %
	install -m 755 -o 0 -g 0 $< $@
