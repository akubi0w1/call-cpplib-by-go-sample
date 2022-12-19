FROM ubuntu

WORKDIR /builder

ENV CMAKE_VERSION=3.25.1
ENV CMAKE_ARCHIVE=cmake-${CMAKE_VERSION}
ENV CMAKE_PACKAGE=https://github.com/Kitware/CMake/releases/download/v${CMAKE_VERSION}/${CMAKE_ARCHIVE}.tar.gz

RUN apt-get update && \
    apt-get upgrade && \
    apt-get install -y curl && \
    apt-get install -y sudo && \
    apt-get install -y build-essential && \
    apt-get install -y clang && \
    apt-get install -y libssl-dev

RUN mkdir -p tmp-cmake
RUN cd tmp-cmake && curl -Lo cmake.tar.gz ${CMAKE_PACKAGE} && tar -zxvf cmake.tar.gz
RUN mv tmp-cmake/${CMAKE_ARCHIVE} /builder/cmake
RUN cd /builder/cmake && \
    ./bootstrap && \
    make && \
    sudo make install
    # make -j12 && \
    # sudo make install -j8

ENV PATH ${PATH}:/builder/cmake/bin
