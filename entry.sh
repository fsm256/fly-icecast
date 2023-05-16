#!/bin/bash

su - icecast

# Start icecast in the background
icecast2 -b -c /app/icecast.xml

# Generate playlist
find /app/mp3 -type f -name '*.mp3' > /app/mp3/playlist.m3u

# Start ezstream
ezstream -c /app/ezstream.xml
