FROM autorippr:latest
RUN apt-get update && apt-get install -y default-jre-headless
ADD settings.cfg /Autorippr/settings.cfg
RUN mkdir /root/.MakeMKV
ADD default.mmcp.xml /root/.MakeMKV/profile.xml
# This is a beta key published by makemkv
RUN echo 'app_Key = "T-aOOAOSdZWjJvlEAkqTMx@FmIUDQ9Uw5gNT2t0HYlnR3M7MpMj4EcvPPV3rImuagWuo"' > /root/.MakeMKV/settings.conf

ENTRYPOINT ["python", "/Autorippr/autorippr.py"]
