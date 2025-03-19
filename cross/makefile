include ../make/make_common.mk
TCGIT      = https://github.com/richfelker/musl-cross-make.git
TCDIR      = musl-cross-make
TCTAG      = 6f3701d08137496d5aac479e3a3977b5ae993c1f
TCTAR      = $(CMN_DNLD)/$(TCDIR)-$(TCTAG).tar.xz
TCREDIR    = >> ../make-$(TCDIR)-$(TCTAG).log 2>&1

default: clean $(TCDIR) do-build-all
tctar: $(TCTAR)

$(TCTAR): 
	$(call gittar,$@,$(TCDIR),$(TCTAG),$(TCGIT))

$(TCDIR): $(TCTAR)
	tar xf $(TCTAR)
	cp -a config.mak $(TCDIR)

do-build-all: $(ARCHDIR)
	cd $(TCDIR) && make -j $(MKJ) $(TCREDIR)
	cd $(TCDIR) && make install $(TCREDIR)

install:

clean:
	rm -rf install $(TCDIR) *.log
