# x2go-ubuntu

A nice and simple set of containers for quickly spinning up a "Remote desktop" environment. Handy for accessing a headless server without installing the x server on it. 

This can be used for a remote desktop on a per user basis to give each person their own desktop, Make sure you mount their home directory outside the container like so: 

~~~~
docker run -itd -p 2222:22/tcp -v /mnt/dockerhome:/home adamprice56/x2go-ubuntu:xfce
~~~~

You can either have one container per user, or share a container with multiple users. RAM usage will be fairly high if you choose one per user!

## Running the containers

**I'd recommend mounting an external directory for /home to preserve data when containers are deleted/updated**

~~~~
docker run -td -p 2222:22 -v /mnt/dockerhome:/home adamprice56/x2go-ubuntu:(latest/kde/xfce)
~~~~

## Usage

TODO: Write usage instructions

## Tags

* latest
  * Basic image with **NO DESKTOP** - Build whatever you want!
* kde
  * You guessed it, it's got the KDE plasma desktop.
* xfce
  * Yep. It's XFCE, just the way xubuntu user's like it.
* 17.10
  * Now updated for ubuntu 17.10! - Just add 17 to the end of the tags to get the 17.10 based version.
