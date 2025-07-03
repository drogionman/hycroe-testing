FROM ubuntu:22.04

# Install all dependencies
RUN apt update && apt install -y \
    tmate \
    openssh-client \
    curl \
    neofetch \
    netcat-openbsd \  # For keeping Railway happy
    && rm -rf /var/lib/apt/lists/*

# Configure custom neofetch
RUN mkdir -p /root/.config/neofetch && \
    cat > /root/.config/neofetch/config.conf << 'EOF'
print_info() {
    prin "    $(color 7)root@hycroe"
    info underline
    info "OS" distro
    info "Host" "Hycroe Node v2"
    info "Kernel" kernel
    info "Uptime" uptime
    info "CPU" cpu
    info "Memory" memory
    info "Disk" disk
}
EOF

# Startup script
COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
