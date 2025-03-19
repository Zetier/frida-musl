include ../make/make_common.mk
DURL       = https://github.com/sqlite/sqlite/archive/refs/tags
SLFILE     = version-3.49.1
UZDIR      = sqlite-$(SLFILE)
CONFFLAGS  = --host=$(CMN_CROSS) 	\
			--prefix=$(CMN_TGTINST)

default: clean tar-src-patch-build

tar-src-patch-build:
	$(call dnuz,$(DURL)/$(SLFILE).tar.gz)
	$(call cnf3,$(CMN_EFLAGS),$(CONFFLAGS),$(UZDIR))
	$(call mk-for4,,prefix=$(CMN_INSTALL),default install,$(UZDIR))

install:

clean:
	rm -rf $(UZDIR) *.log
