FROM ubuntu:14.04
MAINTAINER widder <widder512@yahoo.de>

# Install repos and packages
# RUN apt-get -y upgrade

# Install software and repos
RUN apt-get update && apt-get install -m -y git curl software-properties-common python-software-properties debconf-utils\
    dpkg-dev cmake dkms linux-headers-$(uname -r) build-essential module-assistant supervisor
RUN apt-get install -y debhelper
RUN curl http://apt.tvheadend.org/repo.gpg.key | sudo apt-key add -
RUN echo "deb http://apt.tvheadend.org/stable trusty main" > /etc/apt/sources.list.d/tvheadend.list

RUN apt-get -y install daemontools daemontools-run

RUN apt-add-repository http://apt.tvheadend.org/stable
RUN apt-get update && apt-get install -y tvheadend


RUN mkdir -p /var/log/supervisor
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Ports for Tvheadend service/web
EXPOSE 9981 9982

#CMD ["/usr/bin/tvheadend", "-u", "hts", "-g", "video", "-C"]
#CMD ["/usr/sbin/service", "tvheadend", "start"]
CMD ["/usr/bin/supervisord"]
