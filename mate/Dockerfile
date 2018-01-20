FROM adamprice56/x2go:kali-base
MAINTAINER Adam Price <adam@aprice.cf>

 # fix so resolvconf can be configured
 RUN echo "resolvconf resolvconf/linkify-resolvconf boolean false" | debconf-set-selections


#Install ubuntu mate desktop for MATE + extras
RUN apt-get update -y && apt-get install -y ubuntu-mate-desktop
