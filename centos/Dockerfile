FROM centos:latest

# install ntp
RUN yum install -y ntp

# use custom ntpd config file
COPY assets/ntpd.conf /etc/ntpd.conf
CMD ["/usr/sbin/ntpd"]

# ntp port
EXPOSE 123/udp

# start ntpd in the foreground
ENTRYPOINT ["/usr/sbin/ntpq", "-p"]
