.DEFAULT_GOAL := install

# Create ~/bin and ~/man/man1, then move script and manpage there
install:
	@mkdir -p ~/bin/
	cp -f src/tocsin.py ~/bin/tocsin

# Remove script and manpage
uninstall:
	rm -f ~/bin/tocsin

# Show this message
help:
	@awk -F ':' '/^[[:alpha:]_-]*:/{printf "\033[31m%-20s\033[0m",$$1;print a} {gsub("^# ","",$$0); a=$$0}' $(MAKEFILE_LIST)

.PHONY: help install uninstall
