# Start with a base image containing Java runtime & install bash
FROM openjdk:8-jdk-alpine
RUN apk add bash

# Add the application's jar to the container
ARG JAR_FILE=target/spring-boot-0.0.1-SNAPSHOT.jar
ADD ${JAR_FILE} spring-boot-0.0.1-SNAPSHOT.jar

# Copy init.sh & set permissions 
COPY init.sh /usr/local/bin/
RUN chmod 755 /usr/local/bin/init.sh
ENTRYPOINT ["/usr/local/bin/init.sh"]