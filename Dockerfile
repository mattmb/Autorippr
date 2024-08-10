FROM ubuntu:20.04


RUN apt-get update && apt-get install software-properties-common -y
COPY /build /

RUN apt-get update && apt-get install --allow-unauthenticated -y libssl1.1 libexpat1 libavcodec-extra58 libgl1-mesa-glx unzip git libssl-dev

# HandBrake build deps
RUN apt-get install -y autoconf automake build-essential cmake git libass-dev libbz2-dev libfontconfig-dev libfreetype-dev libfribidi-dev libharfbuzz-dev libjansson-dev liblzma-dev libmp3lame-dev libnuma-dev libogg-dev libopus-dev libsamplerate0-dev libspeex-dev libtheora-dev libtool libtool-bin libturbojpeg0-dev libvorbis-dev libx264-dev libxml2-dev libvpx-dev m4 make meson nasm ninja-build patch pkg-config tar zlib1g-dev python3-pip libvpx-dev curl python2.7
RUN pip3 install meson

# Autorippr deps
ADD "https://bootstrap.pypa.io/pip/2.7/get-pip.py" get-pip.py
RUN python2.7 get-pip.py
RUN python2.7 -m pip install tendo pyyaml peewee pymediainfo==4.3
ADD "http://downloads.sourceforge.net/project/filebot/filebot/FileBot_4.7.2/filebot_4.7.2_amd64.deb?r=http%3A%2F%2Fwww.filebot.net%2F&ts=1473715379&use_mirror=freefr" filebot_4.7.2_amd64.deb
RUN dpkg -i filebot_4.7.2_amd64.deb

# Rust needed for lobdovi
ADD "https://sh.rustup.rs" install-rust.sh
RUN /bin/bash install-rust.sh -y
RUN /bin/bash -c 'source "$HOME/.cargo/env" && cargo install cargo-c && rustup target add  x86_64-pc-windows-gnu'

# Handbrake from source
RUN git clone https://github.com/HandBrake/HandBrake.git && cd HandBrake && git checkout 1.8.1
RUN cd HandBrake && ./configure --launch-jobs=$(nproc) --launch --disable-gtk --enable-libdovi
RUN cd HandBrake/build && make && make install

ADD . /Autorippr

ENTRYPOINT ["python", "/Autorippr/autorippr.py"]

