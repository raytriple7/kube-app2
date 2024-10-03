FROM centos:latest

LABEL "Author"="Raymond Nwanmuo"
LABEL "Project"="cicd-project"

# Install necessary packages
RUN yum install -y httpd zip unzip && \
    yum clean all

# Download and extract the template
ADD https://www.free-css.com/assets/files/free-css-templates/download/page42/history-of-war.zip /var/www/html/

WORKDIR /var/www/html/

# Unzip the downloaded file
RUN unzip history-of-war.zip && \
    cp -rvf history-of-war/* . && \
    rm -rf history-of-war history-of-war.zip

# Run httpd in the foreground
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

# Expose port 80
EXPOSE 80
