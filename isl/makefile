include ../make/make_common.mk
DURL       = https://libisl.sourceforge.io
UZDIR      = isl-0.27
CONFFLAGS  = --host=$(CMN_CROSS) 					\
			--disable-silent-rules					\
			--prefix=$(CMN_TGTINST)
ENVFLAGS  = 						\
	CC=$(CMN_CC)					\
	CXX=$(CMN_CXX)					\
	CFLAGS="$(CMN_CFLAGS)"			\
	CXXFLAGS="$(CMN_CFLAGS)" 		\
	CPPFLAGS="$(CMN_CPPFLAGS)"		\
	LDFLAGS="$(CMN_LDFLAGS)" 		\
 	LIBS="-lgmp"

default: clean tar-src-patch-build 

tar-src-patch-build:
	$(call dnuz,$(DURL)/$(UZDIR).tar.xz)
	$(call cnf3,$(ENVFLAGS),$(CONFFLAGS),$(UZDIR))
	$(call mk-for4,,prefix=$(CMN_INSTALL),default install,$(UZDIR))

install:

clean:
	rm -rf $(UZDIR) *.log
