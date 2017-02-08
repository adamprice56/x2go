FROM ubuntu:xenial
MAINTAINER Adam Price <adam@aprice.cf>

ENV DEBIAN_FRONTEND noninteractive

# Upgrade packages
RUN apt-get update -y && apt-get upgrade -y

# Install requirements
RUN apt-get install -y \
        software-properties-common \
        openssh-server

# Install X2Go server components
RUN add-apt-repository ppa:x2go/stable
RUN apt-get update -y
RUN apt-get install -y x2goserver

# Install KDE suite
RUN apt-get update -y && apt-get install -y plasma-desktop

# SSH runtime
RUN mkdir /var/run/sshd

#Configure root password - CHANGE THIS
RUN echo "root:SuperSecureRootPassword" | chpasswd

# Configure default user
RUN adduser --gecos "X2go User" --disabled-password x2go
RUN echo "x2go:x2go" | chpasswd

# Run it
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
