FROM alpine:3.20

RUN apk add --no-cache \
    curl \
    php82 \
    php82-cgi \
    php82-fpm \
    php82-mysqli \
    php82-mbstring \
    php82-gd \
    php82-cli \
    php82-phar \
    && rm -rf /var/cache/apk/*

RUN wget -q -O /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x /usr/local/bin/wp

COPY ./tools/scriptwordpress.sh /usr/local/bin/scriptwordpress.sh
COPY ./conf/www.conf /etc/php82/php-fpm.d/www.conf

RUN chmod u+x /usr/local/bin/scriptwordpress.sh

WORKDIR /var/www/html

EXPOSE 9000

ENTRYPOINT ["/usr/local/bin/scriptwordpress.sh"]

CMD ["php-fpm82", "-F"]
