# Makefile for NPM related targets

CMD_DIR =  ./node_modules/.bin

INSTALL_TARGETS += install-npm

install-npm:
	npm install


.PHONY: install-npm