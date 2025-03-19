include ../make/make_common.mk
DURL       = https://github.com/openssl/openssl/releases/download/OpenSSL_1_1_1w
UZDIR      = openssl-1.1.1w
SSL_ARCH   = linux-armv4
CONFFLAGS  = $(SSL_ARCH) shared threads zlib-dynamic --prefix=$(CMN_INSTALL)

default: clean tar-src-patch-build

tar-src-patch-build:
	$(call dnuz,$(DURL)/$(UZDIR).tar.gz)
	cd $(UZDIR) &&  			\
	CC=$(CMN_CC)				\
	CFLAGS="$(CMN_CFLAGS)"		\
	CPPFLAGS="$(CMN_CPPFLAGS)"	\
	LDFLAGS="$(CMN_LDFLAGS)" 	\
	./Configure $(CONFFLAGS) > ../configure_$(UZDIR).log  2>&1 
	$(call mk-for4,,,default install,$(UZDIR))

install:

clean:
	rm -rf $(UZDIR) *.log
