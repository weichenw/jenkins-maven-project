# install tomcat 8.0
FROM tomcat:8.0

#load war file to tomcat folder
ADD ./webapp/target/*.war /usr/local/tomcat/webapps/

#image port
EXPOSE 8080

#execute tomcat - optional
CMD ["catalina.sh, "run"]