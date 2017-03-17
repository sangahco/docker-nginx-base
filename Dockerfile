FROM nginx:alpine

COPY ./conf.d/ /etc/nginx/conf.d/
COPY ./stream/ /usr/share/nginx/stream/
COPY ./nginx.conf.template /etc/nginx/

EXPOSE 80
EXPOSE 443

COPY ./docker-entrypoint.sh ./entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

ONBUILD COPY ./conf.d/*.conf /etc/nginx/conf.d/
ONBUILD COPY ./stream/*.conf /etc/nginx/stream/