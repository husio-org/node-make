include make/uglify.mk

OUT_DIR ?= ./public/js
OUT_NAME ?= out
BROWSERIFY_PATH ?= ./clib


# individual targets that need to be built

JS_OBJ = $(SRC_MODULES:.js=.jso)
JS_DEBUG_OBJ = $(SRC_MODULES:.js=.jsdo)

# define export options

EXPORT_OPT = $(addprefix -r , $(EXPORTS))
DEBUG_EXPORT_OPT = $(addprefix -r , $(DEBUG_EXPORTS))

# add taregets to list

BUILD_TARGETS += $(JS_OBJ)
BUILD_DEBUG_TARGETS += $(JS_DEBUG_OBJ)
CLEAN_TARGETS += clean-browserify

SEARCH_PATH += $(BROWSERIFY_PATH)
JSZ_PACK +=  $(JS_OBJ)


clean-browserify:
	-rm  -f $(OUT_DIR)/*.jso $(OUT_DIR)/*.jsdo

#Generic rules to build the targets

%.jso: %.js
	mkdir -p $(OUT_DIR)
	$(CMD_DIR)/browserify $< $(EXPORT_OPT) | $(UGLYFY) > $(OUT_DIR)/$@

%.jsdo: %.js
	mkdir -p $(OUT_DIR)
	$(CMD_DIR)/browserify -d $< $(DEBUG_EXPORT_OPT) -o $(OUT_DIR)/$@