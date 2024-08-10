#!/bin/bash
if makemkvcon info disc:0 | grep HEVC; then
  mv /Autorippr/settings.uhd.cfg /Autorippr/settings.cfg
else
  mv /Autorippr/settings.br.cfg /Autorippr/settings.cfg
fi
exec python2.7 /Autorippr/autorippr.py "$@"
