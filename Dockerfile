FROM alpine:3.6

ENV LANG en_US.UTF-8

COPY grant.sh /usr/local/mariadb/grant.sh
COPY supervisord.conf /etc/supervisord.conf

RUN apk update --no-cache add supervisor &&\
  # MariaDB
    apk --no-cache add mariadb mariadb-client &&\
    mysql_install_db --user=mysql &&\
    cp /usr/share/mysql/mysql.server /etc/init.d/. &&\
    chown -R mysql:mysql /var/lib/mysql &&\

  # supervisord
    mkdir /var/log/supervisor


EXPOSE 3306

CMD ["/usr/bin/supervisord"]
