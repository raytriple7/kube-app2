FROM ubuntu:latest
LABEL "Author"="Raymond Nwanmuo"
LABEL "Project"="moso"
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y git apache2 && \
    apt-get clean

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
EXPOSE 80
WORKDIR /var/www/html
COPY moso.tar.gz /var/www/html
