include ../make/make_common.mk
CMN_PYVEREX  = $(CMN_PYVER).2
DURL         = https://www.python.org/ftp/python/$(CMN_PYVEREX)
UZDIR        = Python-$(CMN_PYVEREX)
CONFFLAGS  = --host=$(CMN_CROSS) 					\
			--build=x86_64-linux-gnu				\
			--enable-shared							\
			--enable-ipv6							\
			--with-openssl=$(CMN_INSTALL)			\
			--enable-loadable-sqlite-extensions		\
			--with-ensurepip=install				\
			--with-system-expat						\
			--with-build-python=$(CMN_PYEXE)		\
			--prefix=$(CMN_TGTINST)

# third-party modules
TPDIR  = third-party
TPRED  = >> ../../make-$(TPDIR).log 2>&1
WHLDIR = $(CMN_SHARE)/wheels
SPDIR  = $(CMN_INSTALL)/lib/$(CMN_PYEXE)/site-packages
COLR   = https://files.pythonhosted.org/packages/d8/53/6f443c9a4a8358a93a6792e2acffb9d9d5cb0a5cfd8802644b7b1c9a02e4
COLNM  = colorama
COLDIR = $(COLNM)-0.4.6
PROT   = https://files.pythonhosted.org/packages/a1/e1/bd15cb8ffdcfeeb2bdc215de3c3cffca11408d829e4b8416dcfe71ba8854
PROTNM = prompt_toolkit
PRODIR = $(PROTNM)-3.0.50
PYG    = https://files.pythonhosted.org/packages/7c/2d/c3338d48ea6cc0feb8446d8e6937e1408088a72a39937982cc6111d17f84
PYGNM  = pygments
PYGDIR = $(PYGNM)-2.19.1
WCW    = https://files.pythonhosted.org/packages/6c/63/53559446a878410fc5a5974feb13d31d78d752eb18aeba59c7fef1af7598
WCWNM  = wcwidth
WCWDIR = $(WCWNM)-0.2.13
WEBS   = https://files.pythonhosted.org/packages/21/e6/26d09fab466b7ca9c7737474c52be4f76a40301b08362eb2dbc19dcc16c1
WSNM   = websockets
WSDIR  = $(WSNM)-15.0.1
ALLTP  = $(COLDIR) $(PRODIR) $(PYGDIR) $(WCWDIR) $(WSDIR) 
TPENV  = $(CMN_EFLAGS) CPPFLAGS="$(CMN_CPPFLAGS) -I$(CMN_INSTALL)/include/$(CMN_PYEXE)" LDFLAGS="$(CMN_LDFLAGS) -L$(GCCLIBPATH)"
tpb    = (cd $(1) && $(TPENV) $(CMN_PYEXE_FULL) -m build --wheel --outdir $(WHLDIR) $(TPRED));
th-for = @$(foreach P,$(1),$(call tpb,$(TPDIR)/$P))

default: clean tar-src-patch-build third-party-mods

# TODO: check presence of /dev/ptmx,ptc
tar-src-patch-build:
	$(call dnuz,$(DURL)/$(UZDIR).tar.xz)
	$(call cnf3,$(CMN_EFLAGS) 												\
		CFLAGS="$(CMN_CFLAGS) -Wno-missing-profile -Wno-stringop-overflow"	\
		CURSES_LIBS="-ltinfow -lncursesw" 									\
		PANEL_LIBS="-lpanelw" 												\
		ac_cv_file__dev_ptmx=no 											\
		ac_cv_file__dev_ptc=no ,$(CONFFLAGS),$(UZDIR))
	$(call mk-for4,,prefix=$(CMN_INSTALL),default install,$(UZDIR))

third-party-mods:
	$(call crdir,$(WHLDIR))
	$(call dnuzd,$(COLR)/$(COLDIR).tar.gz,$(TPDIR))
	$(call dnuzd,$(PROT)/$(PRODIR).tar.gz,$(TPDIR))
	$(call dnuzd,$(PYG)/$(PYGDIR).tar.gz,$(TPDIR))
	$(call dnuzd,$(WCW)/$(WCWDIR).tar.gz,$(TPDIR))
	$(call dnuzd,$(WEBS)/$(WSDIR).tar.gz,$(TPDIR))
	$(call th-for,$(ALLTP))
	$(CMN_PYEXE_FULL) -m wheel tags --platform-tag musllinux_1_1_arm $(WHLDIR)/$(WSDIR)*x86_64*.whl
	rm $(WHLDIR)/$(WSDIR)*x86_64*.whl
	cp -a $(TPDIR)/$(COLDIR)/$(COLNM) $(SPDIR)
	cp -a $(TPDIR)/$(PYGDIR)/$(PYGNM) $(SPDIR)
	cp -a $(TPDIR)/$(PRODIR)/src/$(PROTNM) $(SPDIR)
	cp -a $(TPDIR)/$(WCWDIR)/$(WCWNM) $(SPDIR)
	cp -a $(TPDIR)/$(WSDIR)/src/$(WSNM) $(SPDIR)

# TODO; how to properly cross compile a platform third-party module, see websockets, with shared object
#	cd $(TPDIR)/$(WSDIR) && patch -p1 < ../../patches/$(WSDIR).patch

install:

clean:
	rm -rf $(UZDIR) $(TPDIR) *.log
