# PhatomJS Testing
# Note that PhatomJS is Platform Dependent
# In Some Platform is not supported
# declare PJS_TEST_SERVER pointing to the test server js module


PJS_TEST_SERVER_URL?=http://localhost:9999/

PSJ_OS= $(shell uname)

TEST_TARGETS += phantom_test_$(PSJ_OS)

# PhatonJS is supported in OSX
phantom_test_Darwin: PJS_test


# PhantonJS is not SUpported in SunOS/SmartOS
phantom_test_SunOS:
	echo "PhatonJS not supported, skipping tests"


PJS_test_server_start:
	$(CMD_DIR)/forever start $(PJS_TEST_SERVER)

PJS_test: PJS_test_server_start
	-$(CMD_DIR)/mocha-phantomjs -R $(MOCHA_REPORTER) $(PJS_TEST_SERVER_URL)
	$(CMD_DIR)/forever stop $(PJS_TEST_SERVER)


.PHONY: PJS_test PJS_test_server_start phantom_test_Darwin phantom_test_SunOS