include ../make/make_common.mk
DURL          = https://sourceforge.net/projects/pcre/files/pcre/8.45/
UZDIR        = pcre-8.45
CONFFLAGS      = --host=$(CMN_CROSS) --enable-pcre8 --enable-pcre16 	\
		--enable-pcre32 --enable-shared --disable-silent-rules \
		--enable-jit --prefix=$(CMN_INSTALL)

default: clean tar-src-patch-build 

tar-src-patch-build:
	$(call dnuz,$(DURL)/$(UZDIR).tar.gz)
	$(call cnf3,$(CMN_EFLAGS),$(CONFFLAGS),$(UZDIR))
	$(call mk-for5,,,,default install,$(UZDIR))

install:

clean:
	rm -rf $(UZDIR) *.log
