include ../make/make_common.mk
DURL        = https://ftp.gnu.org/gnu/bash
UZDIR     = bash-5.2.15
BASH_CPPFLAGS = -DTGTHOME='\"$(CMN_TGTHOME)\"' 	\
	-DTGTINST='\"$(CMN_TGTINST)\"' 				\
	-DDEFAULT_PATH_VALUE='\"$(CMN_TGTINST)/bin:$(CMN_TGTINST)/sbin:/usr/sbin:/usr/bin:/sbin:/bin:.\"' 	\
	-DSSH_SOURCE_BASHRC
# bash: xmalloc: locale.c:84: cannot allocate 12 bytes (0 bytes allocated)
CONFFLAGS   = --host=$(CMN_CROSS)		\
			--with-curses 				\
			--enable-readline 			\
			--with-installed-readline	\
			--without-bash-malloc		\
			--prefix=$(CMN_TGTINST)

default: clean tar-src-patch-build

# Dont' use LIBS for libraries, append to LDFLAGS. Stupid makefile builds host exec with LIBS
tar-src-patch-build:
	$(call dnuz,$(DURL)/$(UZDIR).tar.gz)
	cd $(UZDIR) && patch -p1 < ../$(UZDIR).patch
	$(call cnf3,$(CMN_EFLAGS)						\
		CPPFLAGS="$(CMN_CPPFLAGS) $(BASH_CPPFLAGS)"	\
		LDFLAGS="$(CMN_LDFLAGS) -ltinfow -lncursesw",$(CONFFLAGS),$(UZDIR))
	$(call mk-for4,,prefix=$(CMN_INSTALL),default install,$(UZDIR))

install:

clean:
	rm -rf $(UZDIR) *.log
