FROM ubuntu:20.04
LABEL maintainer='narcissekana90@gmail.com'
RUN apt-get update 
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y nginx git wget
RUN rm -Rf /var/www/html/* && git clone https://github.com/thedovekana/webcafe-docker.git  /var/www/html/
EXPOSE 80
ENTRYPOINT ["/usr/sbin/nginx", "-g", "daemon off;"]
