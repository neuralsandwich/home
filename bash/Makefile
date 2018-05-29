MAKEFILE_DIR = $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
FILES := bash_aliases bash_profile bashrc
FILE_ARGUMENTS := $(addprefix -l, $(FILES))
INSTALL_PREFIX = "$(HOME)/."

.PHONY: install
install:
	@echo [INSTALL] Mutt configuration
	$(DOT_DIR)install.sh -p $(INSTALL_PREFIX) $(FILE_ARGUMENTS)

.PHONY: uninstall
uninstall:
	@echo [UNINSTALL] Mutt configuration
	$(MAKEFILE_DIR)/install.sh -r
