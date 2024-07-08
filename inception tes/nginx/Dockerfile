FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y nginx && apt-get install openssl -y

RUN mkdir /etc/nginx/ssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=MA/ST=NONE/L=MED/O=1337/OU=1337/CN=hassimi.42.fr/UID=hassimi"i


COPY ./tools/nginx.conf /etc/nginx/nginx.conf


CMD ["nginx", "-g", "daemon off;"]
