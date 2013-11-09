

OUT_DIR ?= ./public/js
OUT_JSZ_NAME ?= $(OUT_NAME).jsz

JSZ_FP_PACK=$(addprefix $(OUT_DIR)/,$(JSZ_PACK))

BUILD_TARGETS+= $(OUT_JSZ_NAME)

$(OUT_JSZ_NAME): $(JSZ_PACK)
	cat $(JSZ_FP_PACK) | gzip > $(OUT_DIR)/$@