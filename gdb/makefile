include ../make/make_common.mk
DURL       = https://ftp.gnu.org/gnu/gdb
UZDIR    = gdb-16.2
CONFFLAGS  = --host=$(CMN_CROSS) 	\
	--enable-tui					\
	--with-curses					\
	--enable-vtable-verify			\
	--with-system-zlib				\
	--with-system-readline			\
	--with-mpc=$(CMN_INSTALL)		\
	--with-mpfr=$(CMN_INSTALL)		\
	--with-gmp=$(CMN_INSTALL)		\
	--with-isl=$(CMN_INSTALL)		\
	--with-target-bdw-gc=$(CMN_INSTALL)		\
	--disable-isl-version-check				\
	--with-python=$(PWD)/../python/cross-python-for-config \
	--enable-serial-configure 		\
	--enable-threading				\
	--with-zstd						\
	--prefix=$(CMN_TGTINST)

# CC_FOR_BUILD necessary to build 'chew' in 'bfd' subfolder, otherwise cross compiler is used
GDBEFLAGS  = 										\
	$(CMN_EFLAGS)									\
 	LIBS="-ltinfow -lncursesw"						\
	PKG_CONFIG_PATH=$(CMN_INSTALL)/lib/pkgconfig	\
	ZSTD_LIBS="-lzstd"								\
	CC_FOR_BUILD=gcc

default: clean tar-src-patch-build

# 'sim' configure script seems to have a bug; doesn't find -lreadline correctly. Set the readline cache variable
tar-src-patch-build:
	$(call dnuz,$(DURL)/$(UZDIR).tar.xz)
	$(call cnf3,$(GDBEFLAGS),$(CONFFLAGS),$(UZDIR))
	$(call mk-for4,$(GDBEFLAGS) ac_cv_lib_readline_readline=yes,prefix=$(CMN_INSTALL),default install,$(UZDIR))

# 	cd $(UZDIR) && patch -p1 < ../$(UZDIR).patch

install:

clean:
	rm -rf $(UZDIR) *.log
