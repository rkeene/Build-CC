BUILD_CC_VERSION = $(shell svn stat build-cc collect-platform patches scripts platform | grep '^M' >/dev/null && echo `date +%Y%m%dT%H%M` || svn info -R Makefile build-cc collect-platform patches scripts platform | grep 'Last Changed Rev: ' | sed 's@^Last Changed Rev: @r@' | sort -n | tail -1)
BUILD_CC_RELEASE = build-cc-$(BUILD_CC_VERSION).tar.gz

all: $(BUILD_CC_RELEASE)

build-cc-%.tar.gz: Makefile build-cc setup-cc collect-platform patches scripts
	rm -rf __tmp__
	mkdir __tmp__
	mkdir -p __tmp__/$(shell echo "$@" | sed 's@\.tar\.gz$$@@')/platform
	mkdir -p __tmp__/$(shell echo "$@" | sed 's@\.tar\.gz$$@@')/scripts
	cp -rp build-cc setup-cc collect-platform patches LICENSE __tmp__/*/
	-cp platform/*-addons.tar.bz2 platform/README.txt __tmp__/*/platform/
	cp scripts/* __tmp__/*/scripts/
	cd __tmp__/* && sed 's@^CCROOT=.*@CCROOT="/opt/compilers"@;s/@@VERS@@/'"$(BUILD_CC_VERSION)"'/g' build-cc > build-cc.new && cat build-cc.new > build-cc && rm build-cc.new
	cd __tmp__; tar --exclude .svn -zcf "../$@" *
	rm -rf __tmp__

clean:
	rm -rf __tmp__
	rm -f build-cc-*.tar.gz

.PHONY: all clean
