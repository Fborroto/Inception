    FROM alpine:3.20

    RUN apk add --no-cache mariadb mariadb-client

    RUN mkdir -p /var/lib/mysql \   
    && chmod 777 /var/lib/mysql \
    && chown mysql:mysql /var/lib/mysql

    COPY ./tools/dbscript.sh /usr/local/bin/dbscript.sh
    #COPY ./conf/wordpress.sql /usr/local/bin/wordpress.sql
    COPY ./conf/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf

    RUN chmod u+x /usr/local/bin/dbscript.sh 
    #/usr/local/bin/wordpress.sql
    
    EXPOSE 3306

    ENTRYPOINT [ "/usr/local/bin/dbscript.sh" ]

    CMD ["mysqld"]