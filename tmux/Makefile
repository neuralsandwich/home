MAKEFILE_DIR = $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
FILES = tmux.conf
FILE_ARGUMENTS := $(addprefix -l, $(FILES))
INSTALL_PREFIX = "$(HOME)/."

ifeq ($(UNAME_S),Linux)
	PKG_INSTALL = sudo apt-get install -y
	PKG_CHECK := "| xargs dpkg -s '{}' > /dev/null"
	TMUX = /usr/bin/tmux
endif
ifeq ($(UNAME_S),Darwin)
	PKG_INSTALL = brew cask install
	PKG_CHECK := "| xargs brew cask ls --versions"
	TMUX = /usr/local/bin/tmux
endif

.PHONY: tmux
tmux: $(TMUX)

$(TMUX):
	@echo tmux $(PKG_CHECK) \
		echo tmux $(PKG_INSTALL)

.PHONY: install
install: tmux
	@echo [INSTALL] TMux configuration
	$(DOT_DIR)install.sh -p $(INSTALL_PREFIX) $(FILE_ARGUMENTS)

.PHONY: uninstall
uninstall:
	@echo [UNINSTALL] TMux configuration
	$(MAKEFILE_DIR)/install.sh -r
