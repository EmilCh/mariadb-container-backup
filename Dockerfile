FROM alpine:latest
RUN apk add --no-cache mariadb-client bash
COPY root /
RUN chmod +x /*.sh
EXPOSE 80
WORKDIR /backup
VOLUME [ "/backup" ]
CMD ["/run.sh"]