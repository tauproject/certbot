# $Tau: certbot/Makefile $

## ------------------------------------------------------------------------- ##
##                          T A U    P R O J E C T                           ##
## ------------------------------------------------------------------------- ##
##                                                                           ##
## This file forms part of the Tau Project and is subject to copyright.      ##
##                                                                           ##
## For full licensing terms, including conditions for redistribution, please ##
## consult the README document accompanying the source distribution:         ##
##                                                                           ##
##   <https://github.com/tauproject/certbot>                                 ##
##                                                                           ##
## ------------------------------------------------------------------------- ##

prefix = /usr/local
exec_prefix = $(prefix)
bindir = $(prefix)/bin

DOCKERRUNFLAGS = -it tauproject/certbot

all: container

install: container
	mkdir -p $(DESTDIR)$(bindir)
	cp certbot $(DESTDIR)$(bindir)/certbot
	chmod 755 $(DESTDIR)$(bindir)/certbot

container:
	docker build -t tauproject/certbot .

shell: container
	docker run $(DOCKERRUNFLAGS) shell
