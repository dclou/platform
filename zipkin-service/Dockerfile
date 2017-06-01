FROM openjdk:8-jre-alpine
EXPOSE 9411
ADD target/zipkin-service-*.jar /app.jar
RUN sh -c 'touch /app.jar'
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
