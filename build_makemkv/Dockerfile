FROM ubuntu:20.04

RUN apt-get update && DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get install -y python3-virtualenv build-essential pkg-config libc6-dev libssl-dev libexpat1-dev libavcodec-dev libgl1-mesa-dev libcurl4-gnutls-dev zlib1g-dev

ADD http://www.makemkv.com/download/makemkv-oss-1.17.7.tar.gz /src/
ADD http://www.makemkv.com/download/makemkv-bin-1.17.7.tar.gz /src/

RUN tar xf /src/makemkv-bin-1.17.7.tar.gz -C /src


RUN mkdir /src/makemkv-bin-1.17.7/tmp/
RUN echo 'accepted' > /src/makemkv-bin-1.17.7/tmp/eula_accepted

RUN  sed -ie 's#DESTDIR=#DESTDIR=/build#g' /src/makemkv-bin-1.17.7/Makefile

RUN cd /src/makemkv-bin-1.17.7 && make install

RUN tar xf /src/makemkv-oss-1.17.7.tar.gz -C /src

RUN cd /src/makemkv-oss-1.17.7 && ./configure --prefix /build/usr --disable-gui && make install

CMD ["tar", "cz", "/build"]
