FROM ubuntu:22.04

# Set hostname to "hycroe"
RUN echo "hycroe" > /etc/hostname

# Optional: Set custom prompt
RUN echo 'export PS1="root@hycroe:\w\$ "' >> /root/.bashrc

# Avoid interactive prompts during install
ENV DEBIAN_FRONTEND=noninteractive

# Install all required packages
RUN apt update -y && \
    apt upgrade -y && \
    apt install -y \
    curl \
    neofetch \
    sudo \
    openssh-server \
    tmate \
    openssh-client \
    ca-certificates && \
    apt clean

# Create dummy /run/systemd directory to avoid systemctl errors
RUN mkdir -p /run/systemd && ln -sf /bin/true /usr/bin/systemctl

# Set working directory
WORKDIR /root

# Copy your start script
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Start the script
CMD ["/start.sh"]
