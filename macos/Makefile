# Tools
MAKE := make

# Environment
UNAME_S := $(shell uname -s)

# Files
COLOR_SCHEMES := NeuralTerm.terminal
ifeq ($(UNAME_S),Darwin)
	COLOR_TARGETS := NeuralTerm.terminal.installed
else
	COLOR_TARGETS :=
endif

# Rules
all: install

$(COLOR_TARGETS): $(COLOR_SCHEMES)
	@echo [INSTALL] Installing macOS Terminal color scheme
	open $^
	touch $@

install: $(COLOR_TARGETS)

uninstall: $(COLOR_TARGETS)
	@echo [UNINSTALL] Uninstalling macOS Terinal color scheme
