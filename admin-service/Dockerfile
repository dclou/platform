FROM openjdk:8-jre-alpine
VOLUME /tmp
EXPOSE 7070
ADD target/admin-service-*.jar /app.jar
RUN sh -c 'touch /app.jar'
ENTRYPOINT exec java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app.jar