include ../make/make_common.mk
TCGIT      = https://github.com/firasuke/mussel.git
TCDIR      = mussel
TCTAG      = a7f76538654bc57b3d34bd150cc4dffa0b997153
TCTAR      = $(CMN_DNLD)/$(TCDIR)-$(TCTAG).tar.xz
TCREDIR    = >> ../make-$(TCDIR)-$(TCTAG).log 2>&1

default: clean $(TCDIR) do-build-all
tctar: $(TCTAR)

$(TCTAR): 
	$(call gittar,$@,$(TCDIR),$(TCTAG),$(TCGIT))

$(TCDIR): $(TCTAR)
	tar xf $(TCTAR)
	cd $(TCDIR) && patch -p 1 < ../$(TCDIR).patch

do-build-all: $(ARCHDIR)
	cd $(TCDIR) && ./mussel armv6kz --parallel --enable-linux-headers $(TCREDIR)

install:

clean:
	rm -rf $(TCIDIR) $(TCDIR) *.log
