
# The uglify options

UGLY_OPTS ?= -m -c --no-copywrite
#UGLY_OPTS ?= --no-copywrite
UGLYFY = $(CMD_DIR)/uglifyjs $(UGLY_OPTS)