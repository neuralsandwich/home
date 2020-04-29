MAKEFILE_DIR = $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
FILES := bash_aliases bash_profile bashrc
FILE_ARGUMENTS := $(addprefix -l, $(FILES))
INSTALL_PREFIX = "$(HOME)/."

.PHONY: link
link:
	@echo [LINK] Bash configuration
	$(DOT_DIR)link.sh -p $(INSTALL_PREFIX) $(FILE_ARGUMENTS)

.PHONY: unlink
unlink:
	@echo [LINK] Bash configuration
	$(DOT_DIR)/link.sh -r -p $(INSTALL_PREFIX) $(FILE_ARGUMENTS)
