include ../make/make_common.mk
DURL        = https://sourceforge.net/projects/libtirpc/files/libtirpc/1.3.6
UZDIR       = libtirpc-1.3.6
CONFFLAGS   = --host=$(CMN_CROSS) --disable-gssapi --prefix=$(CMN_TGTINST)

default: clean tar-src-patch-build

tar-src-patch-build:
	$(call dnuz,$(DURL)/$(UZDIR).tar.bz2)
	$(call cnf3,$(CMN_EFLAGS) CPPFLAGS="$(CMN_CPPFLAGS) -I$(PWD)/include",$(CONFFLAGS),$(UZDIR))
	$(call mk-for4,,prefix=$(CMN_INSTALL),default install,$(UZDIR))

install:

clean:
	rm -rf $(UZDIR) *.log;
