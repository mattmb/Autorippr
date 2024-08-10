FROM autorippr:latest
RUN apt-get update && apt-get install -y default-jre-headless eject wget libcurl4-gnutls-dev
ADD settings.br.cfg /Autorippr/settings.br.cfg
ADD settings.uhd.cfg /Autorippr/settings.uhd.cfg
RUN mkdir /root/.MakeMKV
RUN rm -rf /share/MakeMKV/default.mmcp.xml
ADD default.mmcp.xml /root/.MakeMKV/profile.xml
#ADD keys_hashed.txt /root/.MakeMKV/keys_hashed.txt
#ADD keydb.cfg /root/.MakeMKV/keydb.cfg
ADD br_uhd_switch.sh /Autorippr/br_uhd_switch.sh
# This is a beta key published by makemkv
RUN echo 'app_Key = "T-NDgYjBUFx5ju1nKbVMthSGSURiL0kEAnjOXD3MudnHtk5OPhXzuSjWbPEKFeBDA7C1"' > /root/.MakeMKV/settings.conf
RUN echo 'app_UpdateEnable = "1"' >> /root/.MakeMKV/settings.conf
RUN echo 'app_UpdateLastCheck = "18868"' > /root/.MakeMKV/update.conf
#RUN mv /usr/lib/jvm/java-8-openjdk-amd64/bin/java /usr/lib/jvm/java-8-openjdk-amd64/bin/java.bak
#RUN mv /usr/bin/java /usr/bin/java.bak
#RUN ln -s /bin/true /usr/lib/jvm/java-8-openjdk-amd64/bin/java
#RUN ln -s /bin/true /usr/bin/java
ENTRYPOINT ["/bin/bash", "/Autorippr/br_uhd_switch.sh"]
