FROM ubuntu:latest
RUN apt-get update \
  && apt-get install -y chrony

 COPY assets/chrony.conf /etc/chrony/chrony.conf

ENTRYPOINT ["chronyd", "-d", "-f", "/etc/chrony/chrony.conf"]