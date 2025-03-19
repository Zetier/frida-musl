include ../make/make_common.mk
DURL       = https://www.mpfr.org/mpfr-current
UZDIR      = mpfr-4.2.1
CONFFLAGS  = --host=$(CMN_CROSS) 					\
			--prefix=$(CMN_TGTINST)

default: clean tar-src-patch-build 

tar-src-patch-build:
	$(call dnuz,$(DURL)/$(UZDIR).tar.xz)
	$(call cnf3,$(CMN_EFLAGS),$(CONFFLAGS),$(UZDIR))
	$(call mk-for4,,prefix=$(CMN_INSTALL),default install,$(UZDIR))

install:

clean:
	rm -rf $(UZDIR) *.log
