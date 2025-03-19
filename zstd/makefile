include ../make/make_common.mk
DURL     = https://github.com/facebook/zstd/releases/download/v1.5.6
UZDIR    = zstd-1.5.6

default: clean tar-src-patch-build 

tar-src-patch-build:
	$(call dnuz,$(DURL)/$(UZDIR).tar.gz)
	$(call mk-for4,$(CMN_EFLAGS) prefix=$(CMN_INSTALL),prefix=$(CMN_INSTALL),default install,$(UZDIR))

install:

clean:
	rm -rf $(UZDIR) *.log
