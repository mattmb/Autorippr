FROM autorippr:latest
RUN apt-get update && apt-get install -y default-jre-headless
ADD settings.cfg /Autorippr/settings.cfg
RUN mkdir /root/.MakeMKV
ADD default.mmcp.xml /root/.MakeMKV/profile.xml
# This is a beta key published by makemkv
RUN echo 'app_Key = "T-LW1uLLbYkVG@LRXgUx8eZlPSc5XtHUoGDg9My9NgOMC@2jNEQjvNY4zLxK8E0YduZT"' > /root/.MakeMKV/settings.conf

ENTRYPOINT ["python", "/Autorippr/autorippr.py"]
