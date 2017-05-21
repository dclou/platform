FROM java:8
VOLUME /tmp
EXPOSE 7070
ADD target/admin-service-*.jar /app.jar
RUN sh -c 'touch /app.jar'
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
