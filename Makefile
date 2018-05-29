MAKE := make

export DOT_DIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
CONFIGS_DS := $(shell find . -maxdepth 1 -mindepth 1 -type d -not -name ".*")
CONFIGS := $(subst ./,, $(CONFIGS_DS))
UTILITIES_MK := $(abspath $(DOT_DIR)/utilities.mk)
.PHONY: all
all: _start install

.PHONY: install $(addprefix install_,$(CONFIGS))
install : $(addprefix install_,$(CONFIGS))
	@echo [INSTALL] All dotfiles installed

.PHONY: uninstall $(addprefix uninstall_,$(CONFIGS))
uninstall : $(addprefix uninstall_,$(CONFIGS))
	@echo [UNINSTALL] Uninstalled dotfiles

_start:
	@echo "################################"
	@echo Installing dotfiles
	@echo "################################"

define CONFIGS_template
TARGET_$(1) := $(addprefix $(HOME)/., $(1))
.PHONY: $$(TARGET_$(1))
$$(TARGET_$(1)): $(1)
	@$(MAKE) -C $(1)

install_$(1): $$(TARGET_$(1))

.PHONY: uninstall_$(1)
uninstall_$(1):
	@$(MAKE) -C $(1) uninstall
endef

$(foreach config,$(CONFIGS),$(eval $(call CONFIGS_template,$(config))))
