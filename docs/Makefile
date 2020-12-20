#
# Spécifique au Projet
#

PROJECT ?= hello
BUILDPATH = ../build

MANPATH = $(BUILDPATH)/usr/share/man
MD2HLPPATH = ../../md2hlp/src/

VERBOSE ?= 0

# %<-------------------------------------------------------------------------->%
#               Ne rien modifier au dela de cette ligne
#

#
# Définition des outils
#

MD2HLP = $(MD2HLPPATH)/md2hlp.py

#
# Définition des options pour les outils
#

ifeq ($(VERBOSE),1)
	MD2HLPFLAGS = -v
else
	ifeq ($(VERBOSE),2)
		MD2HLPFLAGS = -vv
	endif
endif


#
# Cibles make
#

.PHONY: clean mrproper

all: $(MANPATH) $(MANPATH)/$(PROJECT).hlp

configure: $(MANDPATH)

clean:
	cd $(MANPATH) && rm -f *.hlp


mrproper: clean
	@# cd $(MANPATH) && rm -f $(PROJECT).hlp
	rm -rf $(MANPATH)


#
# Règles Make
#


SRC = $(PROJECT).md
OBJS= $(addprefix $(MANPATH)/, $(patsubst %.md,%.hlp, $(SRC)))


#%.hlp: %.md
$(MANPATH)/%.hlp: %.md
	@echo "Create $(PROJECT).hlp"
	@python $(MD2HLP) $(MD2HLPFLAGS) -o $@ -f $<


$(MANPATH)/$(PROJECT).hlp: $(PROJECT).md

$(MANPATH):
	@echo "Create $(BUILDPATH) directory"
	@mkdir -p $(BUILDPATH)
	@echo "Create $(MANPATH) directory"
	@mkdir -p $(MANPATH)

