FROM autorippr:latest
RUN apt-get update && apt-get install -y default-jre-headless eject
ADD settings.cfg /Autorippr/settings.cfg
RUN mkdir /root/.MakeMKV
RUN rm -rf /share/MakeMKV/default.mmcp.xml
ADD default.mmcp.xml /root/.MakeMKV/profile.xml
ADD keys_hashed.txt /root/.MakeMKV/keys_hashed.txt
ADD br_uhd_switch.sh /Autorippr/br_uhd_switch.sh
# This is a beta key published by makemkv
RUN echo 'app_Key = "T-wN2g7CioBviXQJ0x2GDXpXclv3IUnomX@fWO8@GFJ9tFyJPJPwOb6CisnFKkchAE5z"' > /root/.MakeMKV/settings.conf
ENTRYPOINT ["/bin/bash", "/Autorippr/br_uhd_switch.sh"]
