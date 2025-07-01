FROM ubuntu:22.04

# Set hostname and prompt
RUN echo "hycroe" > /etc/hostname && \
    echo 'export PS1="root@hycroe:\w\$ "' >> /root/.bashrc

# Install required packages
RUN apt update -y && apt upgrade -y && \
    apt install -y curl neofetch sudo openssh-server systemctl tmate

# Copy and give execute permission to start.sh
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Start script
CMD ["/start.sh"]
