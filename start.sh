#!/bin/bash

# Start tmate in background and filter SSH connection
(tmate -F 2>&1 | grep --line-buffered "ssh session:" | sed 's/^.*ssh/ssh/') &

# Minimal HTTP server for Railway's port requirement
while true; do
  echo -e "HTTP/1.1 200 OK\n\n<tmate SSH session running>" | nc -lvp ${PORT:-3000}
done
