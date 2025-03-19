include ../make/make_common.mk
DURL       = https://github.com/libexpat/libexpat/releases/download/R_2_6_4
UZDIR      = expat-2.6.4
CONFFLAGS  = --host=$(CMN_CROSS) 					\
			--disable-silent-rules					\
			--prefix=$(CMN_TGTINST)

default: clean tar-src-patch-build 

tar-src-patch-build:
	$(call dnuz,$(DURL)/$(UZDIR).tar.xz)
	$(call cnf3,$(CMN_EFLAGS),$(CONFFLAGS),$(UZDIR))
	$(call mk-for4,,prefix=$(CMN_INSTALL),default install,$(UZDIR))

install:

clean:
	rm -rf $(UZDIR) *.log
