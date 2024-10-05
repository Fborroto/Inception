FROM alpine:3.19

RUN apk update && apk add mariadb mariadb-client

RUN mkdir -p /var/lib/mysql && chown -R mysql:mysql /var/lib/mysql && chmod 777 /var/lib/mysql

COPY ./tools/dbscript.sh /usr/local/bin/

COPY ./conf/wordpress.sql /usr/local/bin/

RUN  chmod +x /usr/local/bin/dbscript.sh

COPY		./conf/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf

RUN chmod +x /usr/local/bin/wordpress.sql

EXPOSE 3306

ENTRYPOINT [ "/usr/local/bin/dbscript.sh" ]

CMD ["mysqld"]