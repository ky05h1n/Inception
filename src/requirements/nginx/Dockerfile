FROM debian:bullseye

RUN apt-get update -y && apt-get install nginx -y

RUN mkdir -p /etc/nginx/ssl
RUN chmod 777 /etc/nginx/ssl

RUN apt-get install openssl -y
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/private.key -out /etc/nginx/ssl/certificate.crt -subj "/C=MA/ST=Bengurir/L=maroc/O=um6p/OU=1337/CN=enja.42.fr"

COPY ./conf/default.conf /etc/nginx/conf.d

RUN chmod 777 /var/www/html

RUN chown -R www-data:www-data /var/www/html

EXPOSE 443

CMD [ "nginx",  "-g daemon off;"]