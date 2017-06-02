FROM openjdk:8-jre-alpine
EXPOSE 9991
ADD target/auth-service-*.jar /app.jar
RUN sh -c 'touch /app.jar'
ENTRYPOINT exec java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app.jar