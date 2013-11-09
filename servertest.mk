# Makefile for server side (node) testing

MOCHA_REPORTER=list

TEST_TARGETS += servertest

servertest:
	-$(CMD_DIR)/mocha -R $(MOCHA_REPORTER)

.PHONY: servertest