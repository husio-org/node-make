

# Default reporters to use during dev/ci

MOCHA_DEV_REPORTER?=list
MOCHA_CI_REPORTER?=xunit


# Check if running under CI

ifdef CI_BUILD
	MOCHA_REPORTER=$(MOCHA_CI_REPORTER)
else
	MOCHA_REPORTER=$(MOCHA_DEV_REPORTER)
endif

# add concrete targets to target list

mocha-test:
	$(CMD_DIR)/mocha -R $(MOCHA_REPORTER) | tee test-log.out

TEST_TARGETS += mocha-test

.PHONY: mocha-test