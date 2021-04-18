FROM tomcat:latest
COPY target/*.jar /usr/local/tomcat/webapps/
EXPOSE 8080
ENTRYPOINT service tomcat start && /bin/bash
