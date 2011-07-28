BUILD_CC_VERSION = $(shell svn info -R build-cc collect-platform patches | grep 'Last Changed Rev: ' | sed 's@^Last Changed Rev: @@' | sort -n | tail -1)
BUILD_CC_RELEASE = build-cc-r$(BUILD_CC_VERSION).tar.gz

all: $(BUILD_CC_RELEASE)

build-cc-r%.tar.gz: build-cc collect-platform patches
	rm -rf __tmp__
	mkdir __tmp__
	mkdir -p __tmp__/$(shell echo "$@" | sed 's@\.tar\.gz$$@@')/platform
	cp -rp build-cc collect-platform patches __tmp__/*/
	cp platform/*-addons.tar.bz2 __tmp__/*/platform/
	cd __tmp__; tar --exclude .svn -zcf "../$@" *
	rm -rf __tmp__

clean:
	rm -rf __tmp__
	rm -f build-cc-*.tar.gz

.PHONY: all clean
