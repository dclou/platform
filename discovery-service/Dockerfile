FROM java:8
VOLUME /tmp
EXPOSE 8761
ADD target/discovery-service-*.jar /app.jar
RUN sh -c 'touch /app.jar'
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
