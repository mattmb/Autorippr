FROM autorippr:latest
RUN apt-get update && apt-get install -y default-jre-headless
ADD settings.cfg /Autorippr/settings.cfg
RUN mkdir /root/.MakeMKV
ADD default.mmcp.xml /root/.MakeMKV/profile.xml
# This is a beta key published by makemkv
RUN echo 'app_Key = "T-rTYSOM9ktvR0Fihn9_2zbORtGKYXUsMtMoraj2fy_wXlDPrx6EX6Xk56opCsOK9bJl"' > /root/.MakeMKV/settings.conf

ENTRYPOINT ["python", "/Autorippr/autorippr.py"]
