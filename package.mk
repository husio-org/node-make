

PACKAGE_VERSION = $(shell node -p "require(\"./package.json\").version")
PACKAGE_NAME = $(shell node -p "require(\"./package.json\").name")