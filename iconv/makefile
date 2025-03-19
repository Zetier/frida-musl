include ../make/make_common.mk
DURL       = https://ftp.gnu.org/pub/gnu/libiconv
UZDIR      = libiconv-1.18
CONFFLAGS  = --host=$(CMN_CROSS) 					\
			--enable-relocatable					\
			--disable-silent-rules					\
			--enable-static							\
			--prefix=$(CMN_TGTINST)

default: clean tar-src-patch-build 

tar-src-patch-build:
	$(call dnuz,$(DURL)/$(UZDIR).tar.gz)
	$(call cnf3,$(CMN_EFLAGS) CFLAGS="$(CMN_CFLAGS) -fPIC",$(CONFFLAGS),$(UZDIR))
	$(call mk-for5,,,prefix=$(CMN_INSTALL),default install,$(UZDIR))

install:

clean:
	rm -rf $(UZDIR) *.log
