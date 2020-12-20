
all: project


.PHONY: configure tests docs clean mrproper

configure:
	@$(MAKE) -C src $@
	@$(MAKE) -C doc $@
	@$(MAKE) -C tests $@

project:
	@$(MAKE) -C src

docs:
	@$(MAKE) -C doc

tests:
	@$(MAKE) -C src $@
	@$(MAKE) -C tests $@

clean:
	@$(MAKE) -C src $@
	@$(MAKE) -C doc $@
	@$(MAKE) -C tests $@


mrproper: clean
	@$(MAKE) -C src $@
	@$(MAKE) -C tests $@
	@$(MAKE) -C docs $@

