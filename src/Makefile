#
# Spécifique au Projet
#

PROJECT = test
BUILDPATH = ../build
OBJPATH = $(BUILDPATH)/obj
BINPATH = $(BUILDPATH)/bin
LIBPATH = $(BUILDPATH)/lib
CC65PATH = ../../cc65/bin
# LD65_CFG = ../cfg/orix.cfg

KERNEL_PATH = ../../orix-software/
SHELL_PATH = ../../orix-software/
SDK_PATH = ../../orix-sdk/

LIBS = orix-sdk.lib

VERSION ?= "0.01"
VERBOSE ?= 0

# %<-------------------------------------------------------------------------->%
#               Ne rien modifier au dela de cette ligne
#

#
# Définition des outils
#

AS = $(CC65PATH)/ca65
LD = $(CC65PATH)/ld65
AR = $(CC65PATH)/ar65

#
# Définition des options pour les outils
#

ifeq ($(DEBUG),yes)
	ASFLAGS = -t telestrat -I $(BUILDPATH) -I $(SDK_PATH) -I $(SHELL_PATH) -I $(KERNEL_PATH) -D VERBOSE_LEVEL=$(VERBOSE) --list-bytes 0 -l $(BUILDPATH)/$(PROJECT).lst --debug-info
	LDFLAGS = -t telestrat  -Ln $(BUILDPATH)/$(PROJECT).ca.sym -m $(BUILDPATH)/$(PROJECT).map --lib-path $(LIBPATH)
	# LDFLAGS = -C "$(LD65_CFG)"  -Ln $(BUILDPATH)/$(PROJECT).ca.sym -m $(BUILDPATH)/$(PROJECT).map --lib-path $(LIBPATH)
else
	ASFLAGS = -t telestrat -I $(BUILDPATH) -I $(SDK_PATH) -I $(SHELL_PATH) -I $(KERNEL_PATH) -D VERBOSE_LEVEL=$(VERBOSE)
	LDFLAGS = -t telestrat  --lib-path $(LIBPATH)
	# LDFLAGS = -C "$(LD65_CFG)"  --lib-path $(LIBPATH)
endif


#
# Règles Make
#

SRC = $(wildcard *.s)
OBJS= $(addprefix $(OBJPATH)/, $(patsubst %.s,%.o, $(SRC)))


all: $(BUILDPATH) $(BINPATH)/$(PROJECT)


#%.o: %.s
$(OBJPATH)/%.o: %.s
	$(AS) $(ASFLAGS) -o $@ $<


# Activer la regle suivante pour creer systematiquement 'build.inc'
# sans faire un 'make configure'
# $(BUILDPATH)/build.inc: configure


$(BINPATH)/$(PROJECT): $(OBJS) $(LIBPATH)/$(LIBS)
	@echo "Create $(PROJECT)"
	$(LD) $(LDFLAGS) -o $@ $^ $(LIBS)
ifeq ($(DEBUG),yes)
	sed -re 's/al 00(.{4}) \.(.+)$$/\1 \2/' $(BUILDPATH)/$(PROJECT).ca.sym | sort > $(BUILDPATH)/$(PROJECT).sym
endif

$(BUILDPATH):
	@echo "Create $(BUILDPATH) directory"
	@mkdir -p $(BUILDPATH)
	@echo "Create $(LIBPATH) directory"
	@mkdir -p $(LIBPATH)
	@echo "Create $(OBJPATH) directory"
	@mkdir -p $(OBJPATH)

$(LIBPATH)/$(LIBS): $(LIBPATH)
	cp ../../orix-sdk/build/lib/*.lib $(LIBPATH)/

configure: $(OBJPATH) $(LIBPATH) $(BINPATH)
	@#date +'.define __DATE__ "__DATE__"'           > $(BUILDPATH)/build.inc
	@#date +'.define __DATE__ "%F %R"'               > $(BUILDPATH)/build.inc
	@#echo  ".define With TeleForth_V${VERSION}"    >> $(BUILDPATH)/build.inc
	@#echo  ".define AUTOSTART_FILE \"${STARTUP}\"" >> $(BUILDPATH)/build.inc

-include $(BUILDPATH)/.depend


.PHONY: clean mrproper deps


deps: $(BUILDPATH)/.depend


$(BUILDPATH)/.depend: $(SRC) $(BUILDPATH)/build.inc
	$(AS) $(ASFLAGS) --create-dep $(BUILDPATH)/.depend -o $(BUILDPATH)/$(OBJ) $<


clean:
	cd $(OBJPATH) && rm -f *.o


mrproper: clean
	cd $(BUILDPATH) && rm -f $(PROJECT) *.lst *.sym .depend build.inc
