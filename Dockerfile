FROM ubuntu:latest
MAINTAINER nagev <np1nagev@gmail.com>

# https://github.com/np1/docker-tor-clientonly
# Based on https://github.com/patrickod/docker-tor

ENV TORNAME tor-0.2.4.23
RUN apt-get update
RUN apt-get install -y libwww-perl build-essential libevent-dev libssl-dev
RUN GET https://www.torproject.org/dist/${TORNAME}.tar.gz | tar xz -C /tmp

RUN cd /tmp/${TORNAME} && ./configure
RUN cd /tmp/${TORNAME} && make
RUN cd /tmp/${TORNAME} && make install
RUN rm -rf /tmp/${TORNAME}

EXPOSE 9150
RUN echo "Log notice stdout" >> /etc/torrc
RUN echo "SocksPort 0.0.0.0:9150" >> /etc/torrc

CMD /usr/local/bin/tor -f /etc/torrc
