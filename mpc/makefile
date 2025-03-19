include ../make/make_common.mk
DURL       = https://ftp.gnu.org/gnu/mpc
UZDIR      = mpc-1.3.1
CONFFLAGS  = --host=$(CMN_CROSS) 					\
			--disable-silent-rules					\
			--prefix=$(CMN_TGTINST)

default: clean tar-src-patch-build 

tar-src-patch-build:
	$(call dnuz,$(DURL)/$(UZDIR).tar.gz)
	$(call cnf3,$(CMN_EFLAGS),$(CONFFLAGS),$(UZDIR))
	$(call mk-for4,,prefix=$(CMN_INSTALL),default install,$(UZDIR))

install:

clean:
	rm -rf $(UZDIR) *.log
