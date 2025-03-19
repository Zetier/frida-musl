include ../make/make_common.mk
DURL       = https://ftp.gnu.org/gnu/gmp
UZDIR      = gmp-6.3.0
CONFFLAGS  = --host=$(CMN_CROSS) 					\
			--enable-silent-rules					\
			--enable-cxx							\
			--prefix=$(CMN_INSTALL)

default: clean tar-src-patch-build 

tar-src-patch-build:
	$(call dnuz,$(DURL)/$(UZDIR).tar.xz)
	$(call cnf3,$(CMN_EFLAGS),$(CONFFLAGS),$(UZDIR))
	$(call mk-for4,,,default install,$(UZDIR))

install:

clean:
	rm -rf $(UZDIR) *.log
