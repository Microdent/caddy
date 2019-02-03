FROM centos

MAINTAINER microd https://blog.deng-quan.com

RUN yum update -y
RUN yum groupinstall -y "development tools"
RUN curl https://getcaddy.com | bash -s personal
RUN mkdir /etc/caddy
RUN touch /etc/caddy/Caddyfile
RUN mkdir /var/www
RUN echo "0.0.0.0:80" >> /etc/caddy/Caddyfile
RUN echo "root /var/www/" >> /etc/caddy/Caddyfile

EXPOSE 80

ENTRYPOINT nohup sh -c '/usr/local/bin/caddy -log stdout -agree=true -conf=/etc/caddy/Caddyfile -root=/var/tmp'
