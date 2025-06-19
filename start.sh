#!/bin/sh

mkdir -p /app/hls

# Inicia FFmpeg (stream dummy desde testsrc por defecto)
ffmpeg -f lavfi -i testsrc=size=640x360:rate=30 -c:v libx264 -tune zerolatency -f hls \
    -hls_time 2 -hls_list_size 5 -hls_flags delete_segments+append_list /app/hls/stream.m3u8 &

# Inicia NGINX
nginx -g "daemon off;"