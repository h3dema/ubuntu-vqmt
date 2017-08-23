FROM docker.io/ubuntu:14.04

RUN apt-get -y update && \
    apt-get -y upgrade && \
    apt-get install -y build-essential && \
    apt-get install -y cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev && \
    apt-get install -y python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev

# install OpenCV (requisite)
# see http://docs.opencv.org/2.4/doc/tutorials/introduction/linux_install/linux_install.html

RUN cd ~
RUN git clone https://github.com/opencv/opencv.git
RUN cd opencv
RUN mkdir release
RUN cd release
RUN cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local ..
RUN make
RUN sudo make install

# install VQMT: Video Quality Measurement Tool
# see https://github.com/Rolinh/VQMT

RUN cd ~
RUN git clone https://github.com/Rolinh/VQMT.git
RUN cd VQMT
RUN make

# see more info at http://mmspg.epfl.ch/vqmt
