#!/bin/bash

echo "Starting tmate session..."

# Create new SSH key if missing
[ ! -f ~/.ssh/id_rsa ] && ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa

# Start tmate session
tmate -F -n hycroe-session -k ~/.ssh/id_rsa
