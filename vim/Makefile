MAKEFILE_DIR = $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
FILES = vim vimrc
FILE_ARGUMENTS := $(addprefix -l, $(FILES))
INSTALL_PREFIX = "$(HOME)/."

LIBCLANG = libclang1-5.0
CLANG_TIDY = clang-tidy
CLANG_DEBS := $(CLANG_TIDY) $(LIBCLANG)
YCM_INSTALL = vim/pack/git-plugins/start/YouCompleteMe/install.py

.PHONY: all
all: install submodules $(YCM_INSTALL).d

.PHONY: install
install:
	@echo [INSTALL] Vim configuration
	$(DOT_DIR)install.sh -p $(INSTALL_PREFIX) $(FILE_ARGUMENTS)

.PHONY: uninstall
uninstall:
	@echo [UNINSTALL] Vim configuration
	$(MAKEFILE_DIR)/install.sh -r

.PHONY: submodules
submodules:
	@echo [INSTALL] Vim: Checking out submodules
	@git submodule update --init --recursive -- $(MAKEFILE_DIR)

.PHONY: cmake
cmake: /usr/bin/cmake
	@echo [INSTALL] Vim: Install CMake

/usr/bin/cmake:
	sudo apt-get install cmake

.PHONY: libclang
libclang: $(LIBCLANG)
	@echo [INSTALL] Vim: Install CMake

.PHONY: $(CLANG_DEBS)
$(CLANG_DEBS): $(LIBCLANG) $(CLANG_TIDY)

$(LIBCLANG):
	@dpkg -s $(CLANG_DEBS) > /dev/null || sudo apt-get install $(LIBCLANG)

$(CLANG_TIDY):
	@dpkg -s $(CLANG_TIDY) > /dev/null \
		|| sudo apt-get install -y $(CLANG_TIDY)

.PHONY: build-essential
build-essential:
	@dpkg -s build-essential > /dev/null \
		|| sudo apt-get install build-essential

.PHONY: ninja
ninja:
	@dpkg -s ninja-build > /dev/null \
		|| sudo apt-get install ninja-build

.PHONY: python-headers
python-headers: python-dev python3-dev

.PHONY: python-dev
python-dev:
	@dpkg -s python-dev > /dev/null \
		|| sudo apt-get install python-dev

.PHONY: python3-dev
python3-dev:
	@dpkg -s python3-dev > /dev/null \
		|| sudo apt-get install python3-dev

$(YCM_INSTALL).d: \
	submodules cmake build-essential $(CLANG_DEBS) ninja python-headers
	@echo [INSTALL] Vim: Install YouCompleteMe
	$(YCM_INSTALL) --clang-completer --clang-tidy --go-completer
	@touch $(YCM_INSTALL).d
