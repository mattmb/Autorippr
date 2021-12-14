FROM ubuntu:16.04

COPY /build/* /

RUN echo "deb http://ppa.launchpad.net/stebbins/handbrake-releases/ubuntu xenial main ">/etc/apt/sources.list.d/handbreak.list && apt-get update && apt-get install --allow-unauthenticated -y python-pip handbrake-cli libssl1.0.0 libexpat1 libavcodec-ffmpeg56 libgl1-mesa-glx unzip 


ADD "http://downloads.sourceforge.net/project/filebot/filebot/FileBot_4.7.2/filebot_4.7.2_amd64.deb?r=http%3A%2F%2Fwww.filebot.net%2F&ts=1473715379&use_mirror=freefr" filebot_4.7.2_amd64.deb
RUN pip install setuptools_scm==5.0.2
RUN pip install tendo pyyaml peewee pymediainfo==4.3
RUN dpkg -i filebot_4.7.2_amd64.deb
ADD . /Autorippr

ENTRYPOINT ["python", "/Autorippr/autorippr.py"]

