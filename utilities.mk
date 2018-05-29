.PHONY: install $(addprefix install_,$(FILES))
install : $(addprefix install_,$(FILES))
	@echo [INSTALL] configuration

.PHONY: uninstall $(addprefix uninstall_,$(FILES))
uninstall : $(addprefix uninstall_,$(FILES))
	@echo [UNINSTALL] configuration

define FILE_targets
TARGET_$(1) := $(addprefix $(1), $(2))
$$(TARGET_$(1)):
	$(call $(MAKEFILE_DIR)$(2) $$(TARGET_$(1))

install_$(2): $$(TARGET_$(1))

uninstall_$(2):
	rm $(1)$(2)
endef

$(foreach file,$(FILES),$(eval $(call FILE_targets,$(TARGET_PREFIX),$(file))))
