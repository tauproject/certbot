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

ORG = tauproject
PACKAGE = certbot
RELEASE = shimmer

prefix = /usr/local
exec_prefix = $(prefix)
bindir = $(prefix)/bin

DOCKERIMAGENAME = $(ORG)/$(PACKAGE)
DOCKERRUNFLAGS = -i -t -e TERM='$(TERM)'

DOCKER = docker
INSTALL = install

all:

install: all
	$(INSTALL) -d $(DESTDIR)/etc/letsencrypt
	$(INSTALL) -d $(DESTDIR)$(bindir)
	$(INSTALL) -m 755 certbot $(DESTDIR)$(bindir)/certbot

container:
	$(DOCKER) build -t $(DOCKERIMAGENAME) -f docker/certbot/Dockerfile .
	$(DOCKER) tag $(DOCKERIMAGENAME) $(DOCKERIMAGENAME):$(RELEASE)

shell: container
	$(DOCKER) run $(DOCKERRUNFLAGS) $(DOCKERIMAGENAME) shell
