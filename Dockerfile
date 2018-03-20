# $Tau: certbot/Dockerfile $

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

FROM debian:stretch

RUN apt-get update -qq -y && \
	apt-get install -qq -y nginx-light curl procps
	
COPY letsencrypt /opt/letsencrypt
RUN /opt/letsencrypt/letsencrypt-auto certificates

EXPOSE 80
RUN rm -rf /etc/letsencrypt/*
RUN rm /var/www/html/index.nginx-debian.html
COPY docker/entrypoint /sbin/container-entrypoint
RUN chmod 755 /sbin/container-entrypoint

ENTRYPOINT [ "/sbin/container-entrypoint" ]
CMD help
