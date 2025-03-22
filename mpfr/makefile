include ../make/make_common.mk
DURL       = https://gitlab.inria.fr/mpfr/mpfr.git
GITTAG     = 4.2.2
UZDIR      = mpfr
GITTAR     = $(CMN_DNLD)/$(UZDIR)-$(GITTAG).tar.xz
CONFFLAGS  = --host=$(CMN_CROSS) 					\
			--prefix=$(CMN_TGTINST)

default: clean $(UZDIR) tar-src-patch-build 
mpfrtar: $(GITTAR)

$(GITTAR): 
	$(call gittar,$@,$(UZDIR),$(GITTAG),$(DURL))

$(UZDIR): $(GITTAR)
	tar xf $(GITTAR)

tar-src-patch-build:
	cd $(UZDIR) && ./autogen.sh
	$(call cnf3,$(CMN_EFLAGS),$(CONFFLAGS),$(UZDIR))
	$(call mk-for4,,prefix=$(CMN_INSTALL),default install,$(UZDIR))

install:

clean:
	rm -rf $(UZDIR) *.log
