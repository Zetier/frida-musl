include ../make/make_common.mk
DURL     = https://github.com/kaniini/libucontext/archive/refs/tags
UZDIR    = libucontext-1.3.2
LCDIR    = libucontext-$(UZDIR)

default: clean tar-src-patch-build 

LC_EFLAGS  = 								\
	CC=$(CMN_CC)							\
	CFLAGS="$(CMN_CFLAGS) $(CMN_CPPFLAGS)"	\
	LDFLAGS="$(CMN_LDFLAGS)"
LCFLG=ARCH=arm $(LC_EFLAGS) prefix=$(CMN_INSTALL)

tar-src-patch-build:
	$(call dnuz,$(DURL)/$(UZDIR).tar.gz)
	$(call mk-for5,,$(LCFLG),$(LCFLG),default install,$(LCDIR))

install:

clean:
	rm -rf $(LCDIR) *.log
