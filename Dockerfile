FROM debian:bullseye

RUN apt update && apt install -y \
  tmate openssh-client curl && \
  apt clean

COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
