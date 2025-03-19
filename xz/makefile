include ../make/make_common.mk
DURL       = https://tukaani.org/xz
UZDIR      = xz-5.6.4
CONFFLAGS  = --host=$(CMN_CROSS) 	\
			--disable-silent-rules 	\
			--disable-debug 		\
			--enable-shared 		\
			--prefix=$(CMN_TGTINST)

default: clean tar-src-patch-build

tar-src-patch-build:
	$(call dnuz,$(DURL)/$(UZDIR).tar.gz)
	$(call cnf3,$(CMN_EFLAGS),$(CONFFLAGS),$(UZDIR))
	$(call mk-for4,,prefix=$(CMN_INSTALL),default install,$(UZDIR))

install:

clean:
	rm -rf $(UZDIR) *.log
