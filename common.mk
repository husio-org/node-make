

VPATH = $(SEARCH_PATH)

#
# Explicit Targets
#

generate: $(GENERATE_TARGETS)

clean-generated:
	rm -f $(GENERATE_TARGETS)

CLEAN_TARGETS += clean-generated

#
# Target recipies
#

build: generate $(BUILD_TARGETS)

debug: generate $(BUILD_DEBUG_TARGETS)

install: $(INSTALL_TARGETS)

test: $(TEST_TARGETS)

clean: $(CLEAN_TARGETS)

pack: $(PACK_TARGETS)

all: build debug

.PHONY: generate build debug all install clean pack