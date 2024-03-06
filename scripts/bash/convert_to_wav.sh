#!/bin/bash

for f in *.m4a; do ffmpeg -i "$f" "$(basename $f).wav"; done

for f in *.mp4; do ffmpeg -i "$f" "$(basename $f).wav"; done