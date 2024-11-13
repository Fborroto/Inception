FROM alpine:3.19

RUN apk update && apk add nginx openssl

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -nodes -sha256 -days 365 -newkey rsa:4096 \
    -out /etc/nginx/ssl/fborroto.crt \
    -keyout /etc/nginx/ssl/fborroto.key \
    -subj "/C=IT/ST=ROME/L=ROME/O=42 Roma Luiss/OU=fborroto/CN=fborroto.42.fr/"

COPY ./conf/default.conf /etc/nginx/http.d/default.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
