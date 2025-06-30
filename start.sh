#!/bin/bash

# Optional: set a fixed SSH key (for reattach)
echo "Starting tmate session..."
tmate -F &

# Print connection info to logs
while true; do
    tmate show-messages || true
    sleep 5
done
