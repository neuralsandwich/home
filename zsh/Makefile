MAKEFILE_DIR = $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
FILES := zsh zshrc zshenv
FILE_ARGUMENTS := $(addprefix -l, $(FILES))
INSTALL_PREFIX = "$(HOME)/."

.PHONY: install
install:
	@echo [INSTALL] ZSH configuration
	$(DOT_DIR)install.sh -p $(INSTALL_PREFIX) $(FILE_ARGUMENTS)

.PHONY: uninstall
uninstall:
	@echo [UNINSTALL] ZSH configuration
	$(MAKEFILE_DIR)/install.sh -r
