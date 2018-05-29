MAKEFILE_DIR = $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
FILES = powerline.conf
FILE_ARGUMENTS := $(addprefix -l, $(FILES))
INSTALL_PREFIX = "$(HOME)/."

.PHONY: install
install:
	@echo [INSTALL] Powerline configuration
	$(DOT_DIR)install.sh -p $(INSTALL_PREFIX) $(FILE_ARGUMENTS)

.PHONY: uninstall
uninstall:
	@echo [UNINSTALL] Powerline configuration
	$(MAKEFILE_DIR)/install.sh -r
