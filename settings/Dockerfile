FROM autorippr:latest
RUN apt-get update && apt-get install -y default-jre-headless
ADD settings.cfg /Autorippr/settings.cfg
RUN mkdir /root/.MakeMKV
RUN rm -rf /share/MakeMKV/default.mmcp.xml
ADD default.mmcp.xml /root/.MakeMKV/profile.xml
# This is a beta key published by makemkv
RUN echo 'app_Key = "T-wN2g7CioBviXQJ0x2GDXpXclv3IUnomX@fWO8@GFJ9tFyJPJPwOb6CisnFKkchAE5z"' > /root/.MakeMKV/settings.conf

ENTRYPOINT ["python", "/Autorippr/autorippr.py"]
