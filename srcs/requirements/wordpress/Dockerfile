FROM alpine:3.19

RUN apk update && apk add php \
php-cgi \
php-mysqli \
php-fpm \
php-pdo \
php-gd php-cli \
php-mbstring \
php-phar \
--no-cache curl

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -O /usr/local/bin/wp && chmod +x /usr/local/bin/wp

COPY ./tools/scriptwordpress.sh /usr/local/bin/

COPY ./conf/www.conf /etc/php82/php-fpm.d/www.conf

RUN  chmod +x /usr/local/bin/scriptwordpress.sh

            
ENTRYPOINT [ "/usr/local/bin/scriptwordpress.sh" ]
EXPOSE 9000

WORKDIR /var/www/html/

CMD ["php-fpm82", "-F"]   
