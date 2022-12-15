CURRENT_PATH = $(shell pwd)

# toolchains
TOOLCHAIN_DIR = $(CURRENT_PATH)/.toolchain
TOOLCHAIN_BIN = $(TOOLCHAIN_DIR)/bin

# cmake
CMAKE = $(TOOLCHAIN_BIN)/cmake/CMake.app/Contents/bin/cmake
CMAKE_VERSION = 3.25.1

# packages
UNAME_S := $(shell uname -s)
ARCH := $(shell uname -m)
ifeq ($(UNAME_S),Darwin)
# See https://cmake.org/download/
	CMAKE_ARCHIVE = cmake-$(CMAKE_VERSION)-macos-universal
	CMAKE_PACKAGE = https://github.com/Kitware/CMake/releases/download/v$(CMAKE_VERSION)/$(CMAKE_ARCHIVE).tar.gz
endif

###########################################
# cmake
cmake-version: $(CMAKE)
	$(CMAKE) --version

# プロジェクトファイルを作成する
# See generators: https://cmake.org/cmake/help/latest/manual/cmake-generators.7.html
cmake-buildpj: $(CMAKE)
	$(CMAKE) -S . -B build/ -G"Unix Makefiles"

# ライブラリをビルドする
cmake-buildlib: $(CMAKE)
	$(CMAKE) --build build/

$(CMAKE):
	mkdir -p $(TOOLCHAIN_BIN)
	mkdir -p $(TOOLCHAIN_DIR)/tmp-cmake
	cd $(TOOLCHAIN_DIR)/tmp-cmake && curl -Lo cmake.tar.gz $(CMAKE_PACKAGE) && tar -zxvf cmake.tar.gz
	mv $(TOOLCHAIN_DIR)/tmp-cmake/$(CMAKE_ARCHIVE) $(TOOLCHAIN_BIN)/cmake
	rm -rf $(TOOLCHAIN_DIR)/tmp-cmake