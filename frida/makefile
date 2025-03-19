include ../make/make_common.mk
FRGIT      = https://github.com/frida/frida.git
FRDDIR     = frida
FRTAG      = 16.6.6
FRTAR      = $(CMN_DNLD)/$(FRDDIR)-$(FRTAG).tar.xz
PDIR       = patches
GENPATCH   = $(PDIR)/releng-$(FRTAG).patch
SDKDIR     = $(FRDDIR)/deps
RELENG     = $(FRDDIR)/releng
FRCORE     = $(FRDDIR)/subprojects/frida-core
HLPRS      = $(FRCORE)/src/linux/helpers
FRGUM      = $(FRDDIR)/subprojects/frida-gum
FRTOOLS    = $(FRDDIR)/subprojects/frida-tools
HOSTTRPL   = linux-$(CMN_ARCH)-musl
SDKFILE    = $(SDKDIR)/sdk-$(HOSTTRPL).tar.xz
ARCHDIR    = archive
FRREDIR    = >> ../make-$(FRDDIR)-$(FRTAG).log 2>&1

default: clean do-make
frtar: $(FRTAR)

$(FRTAR): 
	$(call gittar,$@,$(FRDDIR),$(FRTAG),$(FRGIT))

$(FRDDIR): $(FRTAR)
	tar xf $(FRTAR)
	sed -e 's|FRIDA_MUSL_TOOLCHAIN_LIBDIR|$(CMN_INSTLIB)|' \
		$(PDIR)/releng-$(FRTAG).template > $(GENPATCH)
	cd $(RELENG)  && patch -p1 < ../../$(GENPATCH)
	cd $(FRGUM)   && patch -p1 < ../../../$(PDIR)/frida-gum-$(FRTAG).patch
	cd $(FRCORE)  && patch -p1 < ../../../$(PDIR)/frida-core-$(FRTAG).patch
	cd $(FRTOOLS) && patch -p1 < ../../../$(PDIR)/frida-tools-$(FRTAG).patch

$(ARCHDIR): $(FRDDIR)
	if [ ! -d $(ARCHDIR) ]; then \
		( cd $(FRDDIR) && ./releng/deps.py build --exclude v8 --bundle=sdk --host=$(CMN_CROSS) ); \
		$(call crdir,$(ARCHDIR)) \
		cp -a $(SDKFILE) $(ARCHDIR); \
	fi

$(SDKFILE): $(ARCHDIR)
	$(call crdir,$(SDKDIR))
	[ -f $(SDKFILE) ] || cp -a $(ARCHDIR)/*.xz $(SDKFILE)

do-make: $(SDKFILE)
	cd $(FRDDIR) && ./configure \
		--prefix=$(CMN_INSTALL) \
		--host=$(CMN_CROSS) \
		--enable-frida-tools \
		--enable-graft-tool \
		--enable-gadget \
		--enable-server \
		--enable-portal \
		--enable-inject \
		--enable-frida-python \
		-- 	-Dc_link_args="$(CMN_LDFLAGS) -lucontext_posix -lucontext -liconv" \
			-Dc_args="-I$(CMN_INSTALL)/include/$(CMN_PYEXE)" \
		$(FRREDIR)
	cd $(HLPRS) && make FRIDA_HOST=$(HOSTTRPL) top_srcdir=../../../../.. $(FRREDIR)
	cd $(HLPRS) && if [ "$(CMN_ARCH)" != "arm" ]; then cp -a bootstrapper-$(CMN_ARCH).bin bootstrapper-arm.bin; fi
	cd $(HLPRS) && if [ "$(CMN_ARCH)" != "arm" ]; then cp -a loader-$(CMN_ARCH).bin loader-arm.bin; fi
	cd $(FRDDIR) && make $(FRREDIR)
	@cd $(FRDDIR)/build/subprojects/frida-tools/scripts && \
		for f in $$(find . -type f -name "frida*"); do \
			echo Fixing python path in $$f; \
			sed -i	-e 's|^#!/usr/bin/python.*$$|#!$(CMN_TGTINST)/bin/$(CMN_PYEXE)|' \
					-e 's|$(CMN_INSTALL)|$(CMN_TGTINST)|' \
			$$f; \
		done
	cd $(FRDDIR) && make install $(FRREDIR)

install:

clean:
	rm -rf $(FRDDIR) $(GENPATCH) *.log

distclean: clean
	rm -rf $(ARCHDIR)
