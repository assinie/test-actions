#
# Spécifique au Projet
#

PROJECT = hello
BUILDPATH = ../build
OBJPATH = $(BUILDPATH)/obj
BINPATH = $(BUILDPATH)/bin
CC65PATH = ../../cc65/bin
# LD65_CFG = ../cfg/orix.cfg

KERNEL_PATH = ../../orix-software/
SHELL_PATH = ../../orix-software/
SDK_PATH = ../../orix-sdk/

LIBPATH = $(SDK_PATH)/build/lib
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
	ASFLAGS = -t telestrat -I $(BUILDPATH) -I $(SDK_PATH) -I $(SHELL_PATH) -I $(KERNEL_PATH) -D VERBOSE_LEVEL=$(VERBOSE) --list-bytes 0 -l $(OBJPATH)/$(PROJECT).lst --debug-info
	LDFLAGS = -t telestrat  -Ln $(BINPATH)/$(PROJECT).ca.sym -m $(BINPATH)/$(PROJECT).map --lib-path $(LIBPATH)
	# LDFLAGS = -C "$(LD65_CFG)"  -Ln $(BUILDPATH)/$(PROJECT).ca.sym -m $(BUILDPATH)/$(PROJECT).map --lib-path $(LIBPATH)
else
	ASFLAGS = -t telestrat -I $(BUILDPATH) -I $(SDK_PATH) -I $(SHELL_PATH) -I $(KERNEL_PATH) -D VERBOSE_LEVEL=$(VERBOSE)
	LDFLAGS = -t telestrat  --lib-path $(LIBPATH)
	# LDFLAGS = -C "$(LD65_CFG)"  --lib-path $(LIBPATH)
endif


#
# Cibles make
#

.PHONY: clean mrproper

all: $(BUILDPATH) $(BINPATH)/$(PROJECT)

configure: $(BUILDPATH)

clean:
	cd $(OBJPATH) && rm -f *.o *.lst


mrproper: clean
	# cd $(BINPATH) && rm -f $(PROJECT) *.sym *.map
	rm -rf $(BUILDPATH)


#
# Règles Make
#


SRC = $(wildcard *.s)
OBJS= $(addprefix $(OBJPATH)/, $(patsubst %.s,%.o, $(SRC)))


#%.o: %.s
$(OBJPATH)/%.o: %.s
	$(AS) $(ASFLAGS) -o $@ $<


$(BINPATH)/$(PROJECT): $(OBJS) $(LIBPATH)/$(LIBS)
	@echo "Create $(PROJECT)"
	$(LD) $(LDFLAGS) -o $@ $^ $(LIBS)
ifeq ($(DEBUG),yes)
	sed -re 's/al 00(.{4}) \.(.+)$$/\1 \2/' $(BINPATH)/$(PROJECT).ca.sym | sort > $(BINPATH)/$(PROJECT).sym
endif

$(BUILDPATH):
	@echo "Create $(BUILDPATH) directory"
	@mkdir -p $(BUILDPATH)
	@echo "Create $(BINPATH) directory"
	@mkdir -p $(BINPATH)
	@echo "Create $(OBJPATH) directory"
	@mkdir -p $(OBJPATH)

