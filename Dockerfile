FROM ubuntu:20.04 as distro
ENTRYPOINT ["top", "-b"]
ARG DEBIAN_FRONTEND=noninteractive
LABEL authors="FunkyPancake"
RUN apt-get update -y

FROM distro as toolchain

RUN apt-get upgrade -y
RUN dpkg --add-architecture i386
RUN apt-get install -y iproute2 gawk python3 python build-essential gcc git make net-tools libncurses5-dev tftpd  \
    zlib1g-dev libssl-dev flex bison libselinux1 gnupg wget git-core diffstat chrpath socat xterm autoconf libtool tar  \
    unzip texinfo zlib1g-dev gcc-multilib automake screen pax gzip cpio python3-pip python3-pexpect  \
    xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev pylint3 cmake gdb gcc-multilib
RUN dpkg-reconfigure dash
RUN apt-get autoclean -y
RUN apt-get autoremove -y
RUN apt-get clean

FROM toolchain as sdk
RUN wget -O sdk.sh https://github.com/FunkyPancake/MgdZynq/releases/download/sdk-v1.0.0/sdk.sh
RUN chmod +x sdk.sh
RUN ./sdk.sh