
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

# SSH runtime
RUN mkdir /var/run/sshd

#Configure root password and set it to expire to force user to change
RUN echo "root:SuperSecureRootPassword" | chpasswd
RUN chage -d 0 root

# Configure default user
RUN adduser --gecos "X2go User" --home /home/x2go --disabled-password x2go
RUN echo "x2go:x2go" | chpasswd

#Desktop Note with credits
RUN echo -e "To give the user sudo access, run 'su' and use the password 'SuperSecureRootPassword' (You will be told to change this) and then use 'usermod -aG sudo x2go'.\nEnjoy!\n\nThis script was based on the work of https://github.com/bigbrozer - Check out his Github!" | tee /home/x2go/Desktop/README.txt
RUN chown x2go:x2go /home/x2go/Desktop/README.txt && chmod 777 /home/x2go/Desktop/README.txt

# Run it
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
