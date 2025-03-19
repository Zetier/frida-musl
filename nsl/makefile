include ../make/make_common.mk
DURL       = https://github.com/thkukuk/libnsl/releases/download/v2.0.1
UZDIR      = libnsl-2.0.1
CONFFLAGS  = --host=arm-linux						\
			--disable-silent-rules 					\
			--with-libiconv-prefix=$(CMN_INSTALL) 	\
			--prefix=$(CMN_TGTINST)
NSLLIBS   = -liconv

default: clean tar-src-patch-build

tar-src-patch-build:
	$(call dnuz,$(DURL)/$(UZDIR).tar.xz)
	$(call cnf3,$(CMN_EFLAGS),$(CONFFLAGS),$(UZDIR))
	$(call cnf3,$(CMN_EFLAGS)           				\
		LIBS="$(NSLLIBS)"		        				\
		TIRPC_CFLAGS="-I$(CMN_INSTALL)/include/tirpc"	\
		TIRPC_LIBS="-L$(CMN_INSTLIB) -ltirpc",			\
		$(CONFFLAGS),$(UZDIR))
	$(call mk-for4,,prefix=$(CMN_INSTALL),default install,$(UZDIR))

install:

clean:
	rm -rf $(UZDIR) *.log
