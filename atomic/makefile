include ../make/make_common.mk
DURL       = https://ftp.gnu.org/gnu/gcc/gcc-14.2.0
UZDIR      = gcc-14.2.0
LADIR      = $(UZDIR)/libatomic
CONFFLAGS  = --host=$(CMN_CROSS) 	\
			--disable-silent-rules	\
			--disable-multilib		\
			--prefix=$(CMN_TGTINST)

default: clean tar-src-patch-build 

tar-src-patch-build:
	$(call dnuz,$(DURL)/$(UZDIR).tar.xz)
	cd $(LADIR) && $(CMN_EFLAGS) with_target_subdir=. ./configure $(CONFFLAGS) > ../../configure_libatomic.log 2>&1 
	cd $(LADIR) && make -j $(MKJ) > ../../make-default-libatomic.log 2>&1
	cd $(LADIR) && make prefix=$(CMN_INSTALL) install > ../../make-install-libatomic.log 2>&1

install:

clean:
	rm -rf $(UZDIR) *.log
