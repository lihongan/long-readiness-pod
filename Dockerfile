FROM alpine:3.2

RUN apk add --update openssh-client git tar

ADD caddy /usr/bin/

RUN chmod 0755 /usr/bin/caddy \
 && /usr/bin/caddy -version

EXPOSE 8080 8443
WORKDIR /srv

ADD Caddyfile /etc/Caddyfile
ADD public/ /srv/public/
ADD publics/ /srv/publics/
ADD certs/ /srv/certs

CMD ["sleep", "40"]
ENTRYPOINT ["/usr/bin/caddy"]
CMD ["--conf", "/etc/Caddyfile"]
