FROM alpine/git as repo
MAINTAINER acadalearning@gmail.com
WORKDIR /app
RUN git clone https://github.com/acadalearning/web-app.git
#Maven
FROM maven:3.5-jdk-8-alpine as build
WORKDIR /app
COPY --from=repo /app/web-app  /app
RUN mvn package
#Tomcat
FROM tomcat:8.0.20-jre8 
#COPY  /app/target/*war /usr/local/tomcat/webapps/maven-web-app.war
COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/
