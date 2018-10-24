FROM local/c7-systemd:latest

# install ntp
RUN yum install -y ntp

# use custom ntpd config file
COPY assets/ntpd.conf /etc/ntpd.conf
CMD ["systemctl start ntpd"]

# ntp port
EXPOSE 123/udp

# start ntpd in the foreground
ENTRYPOINT ["ntpq", "-p"]