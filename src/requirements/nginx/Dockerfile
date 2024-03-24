FROM debian:bullseye

RUN apt-get update -y && apt-get install nginx -y

EXPOSE 110

CMD [ "nginx",  "-g daemon off;"]