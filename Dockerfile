FROM centos:latest
ENV container docker
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == \
systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;
CMD ["/usr/sbin/init"]

# install ntp
RUN yum install -y ntp

# use custom ntpd config file
COPY assets/ntpd.conf /etc/ntpd.conf
COPY assets/entrypoint.sh /tmp/entrypoint.sh

# ntp port
EXPOSE 123/udp

# start ntpd in the foreground
ENTRYPOINT ["/tmp/entrypoint.sh"]
