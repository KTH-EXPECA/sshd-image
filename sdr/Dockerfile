FROM samiemostafavi/sshd-dind:latest AS dind-base

# docker build . -t samiemostafavi/sshd-dind-sdr

# install dependencies and tools
RUN apt-get update -y \
    && apt-get upgrade -y \
    && apt-get install -y \
    --no-install-recommends \
    apt-utils \
    software-properties-common \
    build-essential \
    pkg-config screen git wget curl tar vim unzip net-tools

# install UHD 4.3.0.0
RUN apt install -y autoconf automake build-essential \ 
    ccache cmake cpufrequtils doxygen ethtool g++ git \
    inetutils-tools libboost-all-dev libncurses5 libncurses5-dev \
    libusb-1.0-0 libusb-1.0-0-dev libusb-dev python3-dev python3-mako \
    python3-numpy python3-requests python3-scipy python3-setuptools python3-ruamel.yaml
WORKDIR /root
RUN git clone https://github.com/EttusResearch/uhd.git /root/uhd
WORKDIR /root/uhd
RUN git checkout v4.3.0.0
RUN mkdir -p /root/uhd/host/build
WORKDIR /root/uhd/host/build
RUN cmake ../
RUN make -j $(nproc)
RUN make install
RUN ldconfig
RUN uhd_images_downloader

