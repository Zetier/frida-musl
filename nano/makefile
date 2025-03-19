include ../make/make_common.mk
DURL       = https://www.nano-editor.org/dist/v7
UZDIR    = nano-7.2
CONFFLAGS  = --host=$(CMN_CROSS) --disable-debug --enable-extra --enable-multibuffer \
			--enable-nanorc --enable-utf8 --enable-color --prefix=$(CMN_TGTINST)

default: clean tar-src-patch-build

tar-src-patch-build:
	$(call dnuz,$(DURL)/$(UZDIR).tar.gz)
	$(call cnf3,$(CMN_EFLAGS) NCURSESW_LIBS="-ltinfow -lncursesw",$(CONFFLAGS),$(UZDIR))
	$(call mk-for4,,prefix=$(CMN_INSTALL),default install,$(UZDIR))

install:

clean:
	rm -rf $(UZDIR) *.log
