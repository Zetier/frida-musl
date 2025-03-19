include ../make/make_common.mk
DURL       = https://ftp.gnu.org/gnu/binutils
UZDIR    = binutils-2.40
CONFFLAGS  = --host=$(CMN_CROSS) 					\
			--disable-silent-rules					\
			--with-mpc=$(CMN_INSTALL)				\
			--with-mpfr=$(CMN_INSTALL)				\
			--with-gmp=$(CMN_INSTALL)				\
			--with-isl=$(CMN_INSTALL)				\
			--with-target-bdw-gc=$(CMN_INSTALL)		\
			--disable-isl-version-check				\
			--enable-gold=yes						\
			--enable-vtable-verify					\
			--prefix=$(CMN_TGTINST)					\
			--with-zstd								\
 			--with-system-zlib
BUEFLAGS  = $(CMN_EFLAGS)							\
	CPPFLAGS="$(CMN_CPPFLAGS) -D_LARGEFILE64_SOURCE"\
	ac_cv_have_decl_basename=yes

default: clean tar-src-patch-build 

tar-src-patch-build:
	$(call dnuz,$(DURL)/$(UZDIR).tar.xz)
	cd $(UZDIR) && patch -p1 < ../$(UZDIR).patch
	$(call cnf3,$(BUEFLAGS),$(CONFFLAGS),$(UZDIR))
	$(call mk-for4,$(BUEFLAGS),prefix=$(CMN_INSTALL),default install,$(UZDIR))

install:

clean:
	rm -rf $(UZDIR) *.log
