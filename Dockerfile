FROM  ubuntu as builder

WORKDIR /code
COPY opencv ./opencv

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Shanghai

RUN cat /etc/apt/sources.list

RUN apt-get update
RUN apt-get install --yes vim net-tools curl libbz2-dev  wget openssl g++ gcc
RUN apt-get install --yes build-essential libssl-dev zlib1g-dev libncurses5-dev libncursesw5-dev libreadline-dev libsqlite3-dev libgdbm-dev libdb5.3-dev libbz2-dev libexpat1-dev liblzma-dev tk-dev libffi-dev
RUN apt-get -y install libdlib-dev libblas-dev  libatlas-base-dev liblapack-dev libopenblas-dev  libjpeg-turbo8-dev build-essential
RUN apt-get -y install build-essential
RUN apt-get -y install cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev
RUN apt-get -y install libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev

WORKDIR /code/opencv/build
RUN /bin/bash -c "cmake -D CMAKE_BUILD_TYPE=Release -D OPENCV_GENERATE_PKGCONFIG=YES -D CMAKE_INSTALL_PREFIX=/usr/local .."
RUN /bin/bash -c "make -j8"
RUN /bin/bash -c "make install"
RUN echo "include /usr/local/lib" >> /etc/ld.so.conf
RUN /bin/bash -c "ldconfig"
RUN echo "PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/lib/pkgconfig" >> /etc/bash.bashrc
RUN echo "export PKG_CONFIG_PATH" >> /etc/bash.bashrc
RUN /bin/bash -c "source /etc/bash.bashrc"

RUN /bin/bash -c "pkg-config opencv4 --modversion"

RUN apt-get -y install software-properties-common
RUN add-apt-repository ppa:longsleep/golang-backports
RUN apt-get -y install golang-go
# Proxy: https://github.com/goproxy/goproxy.cn/blob/master/README.zh-CN.md
RUN echo "export GO111MODULE=on" >> /root/.bashrc
RUN echo "export GOPROXY=https://goproxy.cn" >> /root/.bashrc
RUN /bin/bash -c "source /root/.bashrc"




