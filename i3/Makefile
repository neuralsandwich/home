MAKEFILE_DIR = $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
FILES = "config"
FILE_ARGUMENTS := $(addprefix -l, $(FILES))
INSTALL_PREFIX = "$(HOME)/.config/i3/"

.PHONY: install
install: config-directory
	@echo [INSTALL] i3 configuration
	$(DOT_DIR)install.sh -p $(INSTALL_PREFIX) $(FILE_ARGUMENTS)

.PHONY: uninstall
uninstall:
	@echo [UNINSTALL] i3 configuration
	$(MAKEFILE_DIR)/install.sh -r

.PHONY: config-directory
config-directory: ${INSTALL_PREFIX}

$(INSTALL_PREFIX):
	@echo [INSTALL] create i3 config directory
	mkdir -p $(INSTALL_PREFIX)
