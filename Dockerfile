FROM nginx:alpine
MAINTAINER Emanuele Disco <emanuele.disco@gmail.com>

COPY ./conf.d/ /etc/nginx/conf.d/
COPY ./nginx.conf.template /etc/nginx/

RUN mkdir -p /usr/share/nginx/stream
RUN mkdir -p /usr/share/nginx/conf.d
ONBUILD COPY ./conf.d/ /usr/share/nginx/conf.d/
ONBUILD COPY ./stream /usr/share/nginx/stream/

EXPOSE 80
EXPOSE 443

COPY ./docker-entrypoint.sh ./entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]