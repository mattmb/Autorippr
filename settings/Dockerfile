FROM autorippr:latest
RUN apt-get update && apt-get install -y default-jre-headless
ADD settings.cfg /Autorippr/settings.cfg
RUN mkdir /root/.MakeMKV
RUN rm -rf /share/MakeMKV/default.mmcp.xml
ADD default.mmcp.xml /root/.MakeMKV/profile.xml
# This is a beta key published by makemkv
RUN echo 'app_Key = "T-_r0kX0iTg1cpZPCL1sofKlaPwiCGGg_PkNKUwSxCy4SlbHfDSF9CSNE5MGRTRh9BPq"' > /root/.MakeMKV/settings.conf

ENTRYPOINT ["python", "/Autorippr/autorippr.py"]
