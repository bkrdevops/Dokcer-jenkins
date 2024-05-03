# Multistage build in Docker
# building the application
FROM nginx
RUN git clone https://github.com/spring-projects/spring-petclinic.git \
&& cd spring-petclinic \
&& mvn package


FROM openjdk:17
LABEL author="bhaskar"
LABEL project="devops"
COPY  /spring-petclinic/target/spring-petclinic-2.7.0-SNAPSHOT.jar /spring-petclinic-2.7.0-SNAPSHOT.jar
EXPOSE 8080
CMD [ "java", "-jar", "/spring-petclinic-2.7.0-SNAPSHOT.jar" ]
