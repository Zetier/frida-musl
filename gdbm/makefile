include ../make/make_common.mk
DURL       = https://ftp.gnu.org/gnu/gdbm
UZDIR      = gdbm-1.24
CONFFLAGS  = --host=$(CMN_CROSS) 					\
			--disable-silent-rules 					\
			--with-readline							\
			--with-libiconv-prefix=$(CMN_INSTALL)	\
			--prefix=$(CMN_TGTINST)
GDBMLIBS   = -ltinfow -lncursesw -liconv -lreadline

default: clean tar-src-patch-build

tar-src-patch-build:
	$(call dnuz,$(DURL)/$(UZDIR).tar.gz)
	$(call cnf3,$(CMN_EFLAGS)           \
		LIBS="$(GDBMLIBS)"		        \
		ac_cv_lib_readline_readline=yes \
		ac_cv_lib_ncurses=yes           \
		,$(CONFFLAGS),$(UZDIR))
	$(call mk-for4,,prefix=$(CMN_INSTALL),default install,$(UZDIR))

install:

clean:
	rm -rf $(UZDIR) *.log
