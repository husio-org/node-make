include make/uglify.mk

# makefile to build browser shims

BUILD_TARGETS += build-shim
BUILD_DEBUG_TARGETS += build-debug-shim
CLEAN_TARGETS += clean-shim

# Where shall we look for modules?

SHIM_PATH?= ./bower_components ./public/js

# Output defaults

OUT_DIR ?= ./public/js
OUT_URL ?= /js
SHIM_OUT ?=vendor.jso
SHIM_DEBUG_OUT ?=vendor.jsdo

# modify targets

SEARCH_PATH += $(SHIM_PATH)
JSZ_PACK +=  $(SHIM_OUT)
BUILD_TARGETS += $(SHIM_OUT)
BUILD_DEBUG_TARGETS += $(SHIM_DEBUG_OUT)

# rules

$(SHIM_OUT): $(SHIM_MODULES)
	-mkdir -p $(OUT_DIR)
	$(UGLYFY) $^ -o $(OUT_DIR)/$(SHIM_OUT)

$(SHIM_DEBUG_OUT): $(SHIM_MODULES)
	-mkdir -p $(OUT_DIR)
	$(UGLYFY) $^ -o $(OUT_DIR)/$(SHIM_DEBUG_OUT) --source-map $(OUT_DIR)/$(SHIM_DEBUG_OUT).map --source-map-url=$(OUT_URL)/$(SHIM_DEBUG_OUT).map --source-map-root=/js -p 2


build-shim:

build-debug-shim:

clean-shim:
	-rm  -f $(OUT_DIR)/*

.PHONY: build-shim build-debug-shim