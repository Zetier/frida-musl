include ../make/make_common.mk
DURL       = https://www.kernel.org/pub/linux/utils/util-linux/v2.40
UZDIR      = util-linux-2.40.4
CONFFLAGS  = --host=$(CMN_CROSS) 	\
			--disable-silent-rules 	\
			--disable-all-programs	\
			--enable-libuuid		\
			--disable-year2038		\
			--prefix=$(CMN_TGTINST)

default: clean tar-src-patch-build

tar-src-patch-build:
	$(call dnuz,$(DURL)/$(UZDIR).tar.xz)
	$(call cnf3,$(CMN_EFLAGS),$(CONFFLAGS),$(UZDIR))
	$(call mk-for4,,prefix=$(CMN_INSTALL),default install,$(UZDIR))

install:

clean:
	rm -rf $(UZDIR) *.log
