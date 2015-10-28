FROM debian:jessie

MAINTAINER github.com/theonlydoo

WORKDIR /etc/

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
	&& apt-get upgrade -y \
	&& apt-get install -y bind9 isc-dhcp-server
	
ADD	conf/bind /etc/bind

ADD	conf/dhcp /etc/dhcp/

ADD conf/run.sh /

ENTRYPOINT ["/bin/bash"]

CMD ["/run.sh"]
