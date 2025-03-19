include ../make/make_common.mk
DURL       = https://github.com/lz4/lz4/releases/download/v1.10.0
UZDIR      = lz4-1.10.0

default: clean tar-src-patch-build

tar-src-patch-build:
	$(call dnuz,$(DURL)/$(UZDIR).tar.gz)
	$(call mk-for4,$(CMN_EFLAGS) prefix=$(CMN_INSTALL),prefix=$(CMN_INSTALL),default install,$(UZDIR))

#	$(call cnf3,$(CMN_EFLAGS),$(CONFFLAGS),$(UZDIR))
#	$(call mk-for4,,prefix=$(CMN_INSTALL),default install,$(UZDIR))

install:

clean:
	rm -rf $(UZDIR) *.log
