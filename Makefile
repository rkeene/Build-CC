BUILD_CC_VERSION = $(shell svn info -R build-cc collect-platform patches | grep 'Last Changed Rev: ' | sed 's@^Last Changed Rev: @@' | sort -n | tail -1)
BUILD_CC_RELEASE = build-cc-r$(BUILD_CC_VERSION).tar.gz

all: $(BUILD_CC_RELEASE)

build-cc-r%.tar.gz: build-cc collect-platform patches
	tar --exclude .svn -zcf "$@" build-cc collect-platform patches

clean:
	rm -f build-cc-*.tar.gz

.PHONY: all clean
