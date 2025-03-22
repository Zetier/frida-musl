
crdir 	= $(foreach P, $(1),\
		if [ ! -d $P ]; then mkdir -p $P; fi;)
dnldif 	= $(foreach P, $(1),\
		if [ ! -f $(CMN_DNLD)/$(notdir $P) ]; then $(CMN_WGET) -L $P -o $(CMN_DNLD)/$(notdir $P); fi;)
dnuz    = @$(call crdir,$(CMN_DNLD))	\
		$(call dnldif,$(1))				\
		tar xf $(CMN_DNLD)/$(notdir $(1))
dnuzd   = @$(call crdir,$(CMN_DNLD) $(2))	\
		$(call dnldif,$(1))					\
		cd $(2)	&& tar xf ../$(CMN_DNLD)/$(notdir $(1))
dnuzi    = @$(call crdir,$(CMN_DNLD))	\
		$(call dnldif,$(1))				\
		unzip $(CMN_DNLD)/$(notdir $(1))
gittar   = @$(call crdir,$(CMN_DNLD)) \
		if [ ! -f $(1) ]; then \
		( cd $(CMN_DNLD) && git clone --recurse-submodules $(4) ); \
		( cd $(CMN_DNLD)/$(2) && git checkout $(3) -b $(2)-$(3) ); \
		( cd $(CMN_DNLD)/$(2) && git submodule update --recursive ); \
		( cd $(CMN_DNLD) && tar cf - $(2) | xz --threads=0 - > $(notdir $(1)) ); \
		( cd $(CMN_DNLD) && rm -rf $(2) ); \
	fi

MKJ		 = $(shell nproc)
mk-tgt   = make $(subst default,,$(1)) -j $(MKJ) > ../make-$(1)-$(2).log 2>&1;
mk-tgt2  = cd $(3) && make $(1) $(subst default,,$(2)) -j $(MKJ) > ../make-$(2)-$(3).log 2>&1 && cd ..;
mk-for   = cd $(2) && $(foreach P,$(1),$(call mk-tgt,$P,$(2)))

# Use as $(call mk-for3,<install-only environment>,<target list>,<directory to execute>)
streq = $(and $(findstring x$(1),x$(2)),$(findstring x$(2),x$(1)))
mk-tgt3  = make $(if $(call streq,$(2),install),$(1),) $(subst default,,$(2)) -j $(MKJ) > ../make-$(2)-$(3).log 2>&1;
mk-for3  = cd $(3) && $(foreach P,$(2),$(call mk-tgt3,$(1),$P,$(3)))
mk-tgt4  = $(if $(call streq,$(3),default),$(1),) make $(if $(call streq,$(3),install),$(2),) $(subst default,,$(3)) -j $(MKJ) > ../make-$(3)-$(4).log 2>&1;
mk-for4  = cd $(4) && $(foreach P,$(3),$(call mk-tgt4,$(1),$(2),$P,$(4)))

# 1)default env, 2)default var, 3)inst var, 4)mk target(s), 5)dir
mk-tgt5  = $(if $(call streq,$(4),default),$(1),) make $(if $(call streq,$(4),default),$(2),) $(if $(call streq,$(4),install),$(3),) $(subst default,,$(4)) -j $(MKJ) > ../make-$(4)-$(5).log 2>&1;
mk-for5  = cd $(5) && $(foreach P,$(4),$(call mk-tgt5,$(1),$(2),$(3),$P,$(5)))

cnf3     = cd $(3) && $(1) ./configure $(2) > ../configure_$(3).log 2>&1 

CMN_DNLD   			= ../dnld
CMN_INSTALL			= $(shell dirname $(PWD))/tool-install/pack
CMN_INSTLIB			= $(CMN_INSTALL)/lib
CMN_PKGCNF          = $(CMN_INSTLIB)/pkgconfig
CMN_SHARE			= $(CMN_INSTALL)/share
CMN_WGET   			= curl
CMN_TGTHOME			= /root
CMN_TGTINST			= ${CMN_TGTHOME}/pack
CMN_RPATH			= $(CMN_TGTINST)/lib
CMN_PYVER			= 3.13
CMN_PYEXE			= python$(CMN_PYVER)
CMN_PYEXE_FULL      = $(shell which $(CMN_PYEXE))

CMN_CROSS    ?= arm-linux-musleabihf
CMN_ARCH      = $(shell echo $(CMN_CROSS) | cut -d- -f1)
CMN_CC        = $(CMN_CROSS)-gcc
CMN_CXX       = $(CMN_CROSS)-g++
CMN_AR        = $(CMN_CROSS)-ar
CMN_CPPFLAGS  = -I$(CMN_INSTALL)/include
CMN_CXXFLAGS  = 
CMN_CFLAGS   +=
CMN_LDFLAGS  += -L$(CMN_INSTALL)/lib -Wl,-rpath=$(CMN_RPATH)
# -Wl,--dynamic-linker,$(CMN_RPATH)/libc.so
CMN_EFLAGS  = 						\
	CC=$(CMN_CC)					\
	CXX=$(CMN_CXX)					\
	CFLAGS="$(CMN_CFLAGS)"			\
	CXXFLAGS="$(CMN_CFLAGS)" 		\
	CPPFLAGS="$(CMN_CPPFLAGS)"		\
	LDFLAGS="$(CMN_LDFLAGS)"

GCCPATH     = $(shell which $(CMN_CC))
GCCROOT     = $(shell dirname  $(GCCPATH))/..
GCCLIBPATH	= $(GCCROOT)/$(CMN_CC:-gcc=)/lib

