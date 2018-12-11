MAKEFILE_DIR = $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
FILES = vim vimrc
FILE_ARGUMENTS := $(addprefix -l, $(FILES))
INSTALL_PREFIX = "$(HOME)/."

CLANG_TIDY = clang-tidy
CLANG_DEBS := $(CLANG_TIDY) $(LIBCLANG)
YCM_INSTALL = vim/pack/git-plugins/start/YouCompleteMe/install.py

UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Linux)
	LIBCLANG = libclang1-5.0
	PKG_INSTALL = sudo apt-get install -y
	PKG_CHECK := "| xargs dpkg -s '{}' > /dev/null"
	PYTHON_HEADERS = python-dev python3-dev
endif
ifeq ($(UNAME_S),Darwin)
	PKG_INSTALL = brew install
	PKG_CHECK := "| xargs brew ls --versions"
endif

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
	echo cmake $(PKG_CHECK) \
		|| $(PKG_INSTALL) cmake

.PHONY: libclang
libclang: $(LIBCLANG)
	@echo [INSTALL] Vim: Install CMake

.PHONY: $(CLANG_DEBS)
$(CLANG_DEBS): $(LIBCLANG) $(CLANG_TIDY)

$(LIBCLANG):
	@echo $(CLANG_DEBS) $(PKG_CHECK) \
		|| echo $(LIBCLANG) $(PKG_INSTALL)

$(CLANG_TIDY):
	@echo $(CLANG_TIDY) $(PKG_CHECK) \
		|| echo $(CLANG_TIDY) $(PKG_INSTALL)

.PHONY: build-essential
build-essential:
	@echo build-essential $(PKG_CHECK) \
		|| echo build-essential $(PKG_INSTALL)

.PHONY: ninja
ninja:
	@echo ninja $(PKG_CHECK) \
		|| echo ninja $(PKG_INSTALL)

.PHONY: python-headers
python-headers: $(PYTHON_HEADERS)

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
	pip3 install jedi
	python3 $(YCM_INSTALL) --clang-completer --clang-tidy --go-completer
	@touch $(YCM_INSTALL).d
