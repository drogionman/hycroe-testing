#!/bin/bash
echo "🌐 Starting Hycroe test container..."
neofetch || true
echo "🔓 SSH is available (if configured)"
# Prevent container from exiting
tail -f /dev/null
