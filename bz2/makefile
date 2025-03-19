include ../make/make_common.mk
DURL       = https://sourceware.org/pub/bzip2
UZDIR      = bzip2-1.0.8
CONFFLAGS  = --host=$(CMN_CROSS) 	\
		--prefix=$(CMN_TGTINST)
BZ2        = $(UZDIR)/bzip2-shared
LIBBZ2     = $(UZDIR)/libbz2.so
default: clean tar-src-patch-build

tar-src-patch-build:
	$(call dnuz,$(DURL)/$(UZDIR).tar.gz)
	cd $(UZDIR) && patch -p1 < ../$(UZDIR).patch
	cd $(UZDIR) && $(CMN_EFLAGS) make -f Makefile-libbz2_so > ../make-all-$(UZDIR).log 2>&1
	cp -a $(UZDIR)/bzlib.h $(CMN_INSTALL)/include
	cp -a $(LIBBZ2)* $(CMN_INSTALL)/lib
	cp -a $(BZ2) $(CMN_INSTALL)/bin/bzip2

install:

clean:
	rm -rf $(UZDIR) *.log
