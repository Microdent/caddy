FROM centos

MAINTAINER microd https://blog.deng-quan.com

RUN curl https://getcaddy.com | bash -s personal
RUN mkdir /etc/caddy
RUN touch /etc/caddy/Caddyfile
RUN mkdir /etc/ssl/caddy
RUN chmod 0770 /etc/ssl/caddy
RUN mkdir /var/www

EXPOSE 80

ENTRYPOINT nohup sh -c '/usr/local/bin/caddy -log stdout -agree=true -conf=/etc/caddy/Caddyfile -root=/var/tmp'
