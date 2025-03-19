include ../make/make_common.mk
DURL       = https://github.com/htop-dev/htop/releases/download/3.3.0
UZDIR      = htop-3.3.0
HTOP_EXECS = htop
CONFFLAGS  = --host=$(CMN_CROSS)	\
		--enable-unicode 			\
		--enable-affinity			\
		--prefix=$(CMN_TGTINST)
# not unwind or capabilities; need libs
default: clean tar-src-patch-build

tar-src-patch-build:
	$(call dnuz,$(DURL)/$(UZDIR).tar.xz)
	$(call cnf3,$(CMN_EFLAGS) LIBS="-ltinfow",$(CONFFLAGS),$(UZDIR))
	$(call mk-for4,,prefix=$(CMN_INSTALL),default install,$(UZDIR))

install:

clean:
	rm -rf $(UZDIR) *.log
