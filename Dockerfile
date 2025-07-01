FROM ubuntu:22.04

# Set hostname to "hycroe"
RUN echo "hycroe" > /etc/hostname

# Optional: Set PS1 to reflect "root@hycroe"
RUN echo 'export PS1="root@hycroe:\w\$ "' >> /root/.bashrc

# Install needed packages
RUN apt update -y && apt upgrade -y && apt install curl -y && apt install neofetch -y && apt install sudo && apt install systemctl -y && apt install -y openssh-server

# Copy and set permissions
COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
