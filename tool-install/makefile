include ../make/make_common.mk
PACK       = pack
FOLDERS		= $(PACK)/bin 		\
			$(PACK)/etc 		\
			$(PACK)/include 	\
			$(PACK)/lib 		\
			$(PACK)/share
TARPRFX     = ../$(PACK)-$(CMN_ARCH)
#GCCPATH     = $(shell which $(CMN_CC))
#GCCROOT     = $(shell dirname  $(GCCPATH))/..
#GCCLIBPATH	= $(GCCROOT)/$(CMN_CC:-gcc=)/lib

default: clean dircreate

dircreate:
	mkdir -p $(FOLDERS)

tar:
	tar cf - $(PACK) | gzip > $(TARPRFX)-$(shell git rev-parse --short HEAD)-$(shell git describe --broken --dirty --all | cut -d/ -f2).tar.gz

install:

#	cp -a $(GCCLIBPATH)/*.so*          $(PACK)/lib 
#	cp -a $(CMN_LCPATH)                $(PACK)/lib
#	cp -a ../../scripts/target/*.sh    $(PACK)/bin
#	[ ! -d $(PACK)/share/bash ] && mkdir $(PACK)/share/bash
#	cp -a ../../scripts/target/dot-*   $(PACK)/share/bash
#	cp -a ../../scripts/gef/dot.*      $(PACK)/share/bash

clean:
	rm -rf $(PACK) $(TARPRFX)*
