PREPROCESS_ROOT ?= bower_components

%_gx.js: %.jsx
	$(CMD_DIR)/preprocess $< $(PREPROCESS_ROOT) > $@