MAKEFILE_DIR = $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
FILES = powerline.conf
FILE_ARGUMENTS := $(addprefix -l, $(FILES))
INSTALL_PREFIX = "$(HOME)/."

UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Linux)
	PKG_INSTALL = sudo apt-get install -y
	PKG_CHECK := "| xargs dpkg -s '{}' > /dev/null"
	POWERLINE_FONTS = fonts-powerline
endif
ifeq ($(UNAME_S),Darwin)
	PKG_INSTALL = brew install
	PKG_CHECK := "| xargs brew ls --versions"
endif

.PHONY: powerline
powerline: $(HOME)/.local/bin/powerline
	@echo $(POWERLINE_FONTS) $(PKG_CHECK)
	@echo $(POWERLINE_FONTS) $(PKG_INSTALL)

$(HOME)/.local/bin/powerline:
	@pip3 install powerline-status

.PHONY: install
install:
	@echo [INSTALL] Powerline configuration
	$(DOT_DIR)install.sh -p $(INSTALL_PREFIX) $(FILE_ARGUMENTS)

.PHONY: uninstall
uninstall:
	@echo [UNINSTALL] Powerline configuration
	$(MAKEFILE_DIR)/install.sh -r
