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

FROM tauproject/core:shimmer

RUN apt-get install -qq -y nginx-light curl procps certbot
EXPOSE 80
RUN rm -rf /etc/letsencrypt/*
RUN rm /var/www/html/index.nginx-debian.html
RUN mkdir /app /app/etc
COPY scripts/docker/entrypoint /app/entrypoint
RUN chmod 755 /app/entrypoint
RUN mkdir -p /var/www/.well-known/acme
COPY docker/certbot/cli.ini /app/etc/certbot-cli.ini

VOLUME /etc/letsencrypt
VOLUME /var/www/html/.well-known/acme

ENTRYPOINT [ "/app/entrypoint" ]
CMD [ "--help" ]
