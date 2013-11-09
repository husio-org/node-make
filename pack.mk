# Packing
#
# By default will follow links, compress, and search for a list of default dirs/files
# the list can be substituted, or extended
# use PACK_EXTRA_FILES PACK_EXTRA_DIRS variables to extend

include make/package.mk

PACK_DIRS ?= lib public config smf bin $(PACK_EXTRA_DIRS)

PACK_FILES ?= package.json index.js $(PACKAGE_NAME).js $(PACK_EXTRA_FILES)

PACK_TAR_OPTIONS ?= hvz

OUT_PACK_NAME ?= $(PACKAGE_NAME)-$(PACKAGE_VERSION).tgz

OUT_PACK_DIR  ?= $(PACKAGE_NAME)-$(PACKAGE_VERSION)

PACK_ALL_EXISTS = $(wildcard $(PACK_DIRS) $(PACK_FILES))

PACK_ALL = $(addprefix $(OUT_PACK_DIR)/, $(PACK_ALL_EXISTS))

PACK_TARGETS += $(OUT_PACK_NAME)

CLEAN_TARGETS += CLEAN_PACK

CLEAN_PACK:
	rm -f $(OUT_PACK_NAME)
	rm -f $(OUT_PACK_DIR)

$(OUT_PACK_NAME):
	ln -s . $(OUT_PACK_DIR)
	tar  -c$(PACK_TAR_OPTIONS)f $(OUT_PACK_NAME) $(PACK_ALL)
	rm $(OUT_PACK_DIR)
