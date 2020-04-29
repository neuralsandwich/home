MAKE := make

export DOT_DIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
CONFIGS_DS := $(shell find . -maxdepth 1 -mindepth 1 -type d -not -name ".*")
CONFIGS := $(subst ./,, $(CONFIGS_DS))
UTILITIES_MK := $(abspath $(DOT_DIR)/utilities.mk)
.PHONY: all
all: _start link

.PHONY: link $(addprefix link_,$(CONFIGS))
link: $(addprefix link_,$(CONFIGS))
	@echo [LINK] Linked dotfiles

.PHONY: unlink $(addprefix unlink_,$(CONFIGS))
unlink : $(addprefix unlink_,$(CONFIGS))
	@echo [UNLINK] Unlinked dotfiles

_start:
	@echo "################################"
	@echo Linking dotfiles
	@echo "################################"

define CONFIGS_template
TARGET_$(1) := $(addprefix $(HOME)/., $(1))
.PHONY: $$(TARGET_$(1))
$$(TARGET_$(1)): $(1)
	@$(MAKE) -C $(1)

link_$(1): $$(TARGET_$(1))

.PHONY: unlink_$(1)
unlink_$(1):
	@$(MAKE) -C $(1) unlink
endef

$(foreach config,$(CONFIGS),$(eval $(call CONFIGS_template,$(config))))
