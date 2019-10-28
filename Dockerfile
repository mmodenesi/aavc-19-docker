# https://www.pyimagesearch.com/2018/08/15/how-to-install-opencv-4-on-ubuntu/
FROM ubuntu:latest
ARG OPENCV_VERSION=4.1.1

RUN apt-get update && apt-get dist-upgrade -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    wget build-essential cmake unzip pkg-config \
    libjpeg-dev libpng-dev libtiff-dev \
    libavcodec-dev libavformat-dev libswscale-dev libv4l-dev \
    libxvidcore-dev libx264-dev \
    libatlas-base-dev gfortran \
    python3-dev python3-pip \
    pandoc texlive-xetex && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN pip3 install numpy matplotlib jupyterlab scipy
RUN pip3 install torch==1.3.0+cpu torchvision==0.4.1+cpu -f https://download.pytorch.org/whl/torch_stable.html



WORKDIR /usr/local/sources

RUN wget -O opencv.zip https://github.com/opencv/opencv/archive/${OPENCV_VERSION}.zip && unzip opencv.zip
RUN wget -O opencv_contrib.zip https://github.com/opencv/opencv_contrib/archive/${OPENCV_VERSION}.zip && unzip opencv_contrib.zip

RUN mkdir /usr/local/sources/opencv-${OPENCV_VERSION}/build && \
    cd /usr/local/sources/opencv-${OPENCV_VERSION}/build && \
    cmake -D CMAKE_BUILD_TYPE=RELEASE \
        -D CMAKE_INSTALL_PREFIX=/usr/local \
        -D INSTALL_PYTHON_EXAMPLES=ON \
        -D INSTALL_C_EXAMPLES=OFF \
        -D OPENCV_ENABLE_NONFREE=ON \
        -D OPENCV_EXTRA_MODULES_PATH=/usr/local/sources/opencv_contrib-${OPENCV_VERSION}/modules \
        -D PYTHON_EXECUTABLE=$(which python3) \
        -D BUILD_EXAMPLES=ON .. && \
    make -j4 && \
    make install && \
    ldconfig

WORKDIR /workspace
VOLUME /workspace
EXPOSE 8888
CMD ["jupyter", "notebook", "--allow-root", "--ip", "0.0.0.0", "--port", "8888"]
