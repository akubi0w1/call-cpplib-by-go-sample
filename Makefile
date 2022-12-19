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

cmake-help:
	$(CMAKE) --build

###########################################
# linux container build

# build builder
docker-build-builder:
	docker build -t cmake-builder -f docker/build/Dockerfile .

# build library
docker-build-lib:
	docker run -it -v $(CURRENT_PATH):/mount -w /mount cmake-builder cmake -S /mount -B /mount/build/ -G"Unix Makefiles"
	docker run -it -v $(CURRENT_PATH):/mount -w /mount cmake-builder cmake --build /mount/build/

# execute
docker-build-executor:
	docker build -t cmake-executor -f docker/executor/Dockerfile .

docker-executor:
	docker run -it -v $(CURRENT_PATH):/mount -w /mount cmake-executor /bin/bash