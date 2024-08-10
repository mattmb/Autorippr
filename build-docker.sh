#!/bin/bash -e
#
# Createas a container with autorippr in 
#
# Run like
#
# docker run -ti -v /tmp:/tmp  --device=/dev/sr1 autorippr --all --debug
#


rm -rf build/*
docker build -t buildmakemkv ./build_makemkv
docker run --rm buildmakemkv | tar xz
mkdir -p build/usr/local/bin
mv build/usr/bin build/usr/local
docker build -t autorippr .
