FROM nginx:1.18.0-alpine
LABEL maintainer="Emanuele Disco <emanuele.disco@gmail.com>"

COPY ./conf.d/ /etc/nginx/conf.d/
COPY ./nginx.template.conf /etc/nginx/
COPY ./ssl/ /etc/nginx/ssl/

RUN mkdir -p /usr/share/nginx/stream
RUN mkdir -p /usr/share/nginx/conf.d
ONBUILD COPY ./conf.d/ /usr/share/nginx/conf.d/
ONBUILD COPY ./stream /usr/share/nginx/stream/

EXPOSE 80
EXPOSE 443

RUN rm /var/log/nginx/access.log
VOLUME [ "/var/log/nginx" ]

COPY ./docker-entrypoint.sh ./entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]