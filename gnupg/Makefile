MAKEFILE_DIR = $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
FILES = gpg.conf gpg-agent.conf
FILE_ARGUMENTS := $(addprefix -l, $(FILES))
INSTALL_PREFIX = "$(HOME)/.gnupg/"

.PHONY: install
install:
	@echo [INSTALL] Mutt configuration
	$(DOT_DIR)install.sh -p $(INSTALL_PREFIX) $(FILE_ARGUMENTS)

.PHONY: uninstall
uninstall:
	@echo [UNINSTALL] Mutt configuration
	$(MAKEFILE_DIR)/install.sh -r
