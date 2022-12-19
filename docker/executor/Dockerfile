FROM --platform=linux/amd64 golang:1.19

COPY ./build /cmakebuild

RUN cp /cmakebuild/libTestLibrary.so /usr/local/lib/libTestLibrary.so
RUN echo "/usr/local/lib" > /etc/ld.so.conf.d/usr-local-lib.conf
RUN ldconfig
