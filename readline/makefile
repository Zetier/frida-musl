include ../make/make_common.mk
DURL       = https://ftp.gnu.org/gnu/readline
UZDIR      = readline-8.2.13
CONFFLAGS  = --host=$(CMN_CROSS) 			\
			--disable-static 				\
			--enable-shared 				\
			--with-curses 					\
			--with-shared-termcap-library 	\
			--prefix=$(CMN_TGTINST)

default: clean tar-src-patch-build

tar-src-patch-build:
	$(call dnuz,$(DURL)/$(UZDIR).tar.gz)
	$(call cnf3,$(CMN_EFLAGS) LDFLAGS="$(CMN_LDFLAGS) -ltinfow -lncursesw",$(CONFFLAGS),$(UZDIR))
	$(call mk-for4,,prefix=$(CMN_INSTALL),default install,$(UZDIR))
# Strange, if LIBS, then the NEEDED elf sections don't ask for those libs; move them to LDFLAGS instead
#	LIBS="-ltinfow -lncursesw"	\

install:

clean:
	rm -rf $(UZDIR) *.log
