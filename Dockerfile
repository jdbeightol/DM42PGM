FROM ubuntu:latest
COPY gcc-arm-none-eabi-7-2018-q2-update-linux.tar.bz2 /tmp/gcc-arm-none-eabi-7-2018-q2-update-linux.tar.bz2
RUN mkdir -p /usr/local/share/arm
RUN tar -C /usr/local/share/arm -xjf /tmp/gcc-arm-none-eabi-7-2018-q2-update-linux.tar.bz2
RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    make \
    libarchive-zip-perl
RUN (cd /usr/local/share/arm/gcc-arm-none-eabi-7-2018-q2-update/bin/ && \
    for x in *; do \
        ln -s /usr/local/share/arm/gcc-arm-none-eabi-7-2018-q2-update/bin/$x /usr/local/bin/$x; \
    done)
