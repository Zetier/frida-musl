include ../make/make_common.mk
DURL       = https://invisible-mirror.net/archives/ncurses
UZDIR    = ncurses-6.5
CONFFLAGS  = --host=$(CMN_CROSS) 					\
			--enable-symlinks						\
			--with-cxx-shared 						\
			--enable-overwrite						\
			--disable-termcap						\
			--with-shared							\
			--without-debug							\
			--with-fallbacks=xterm-256color 		\
			--with-termlib							\
			--enable-widec							\
			--enable-pc-files						\
			--enable-sp-funcs						\
			--enable-ext-colors 					\
			--enable-ext-mouse						\
			--enable-ext-putwin						\
			--enable-sigwinch						\
			--prefix=$(CMN_TGTINST)

default: clean tar-src-patch-build 

tar-src-patch-build:
	$(call dnuz,$(DURL)/$(UZDIR).tar.gz)
	$(call cnf3,$(CMN_EFLAGS) INSTALL="$(shell which install) --strip-program=$(CMN_CROSS)-strip",$(CONFFLAGS),$(UZDIR))
	$(call mk-for4,,prefix=$(CMN_INSTALL) ticdir=$(CMN_INSTALL)/share/terminfo,default install,$(UZDIR))

install:

clean:
	rm -rf $(UZDIR) *.log
