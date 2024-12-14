.DEFAULT_GOAL := install

install:
	@mkdir -p ~/bin/
	cp -f src/tocsin.py ~/bin/tocsin

uninstall:
	rm -f ~/bin/tocsin

.PHONY: install uninstall
