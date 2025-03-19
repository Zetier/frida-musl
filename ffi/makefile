include ../make/make_common.mk
DURL       = https://github.com/libffi/libffi/releases/download/v3.4.7
UZDIR      = libffi-3.4.7
CONFFLAGS  = --host=$(CMN_CROSS) 					\
			--disable-silent-rules					\
			--prefix=$(CMN_INSTALL)

default: clean tar-src-patch-build 

# prefix= doesn't work in this configure setup
tar-src-patch-build:
	$(call dnuz,$(DURL)/$(UZDIR).tar.gz)
	$(call cnf3,$(CMN_EFLAGS),$(CONFFLAGS),$(UZDIR))
	$(call mk-for4,,,default install,$(UZDIR))

install:

clean:
	rm -rf $(UZDIR) *.log
