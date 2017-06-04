FROM openjdk:8-jre-alpine
VOLUME /tmp
EXPOSE 7070
ADD target/admin-service-*.jar /app.jar
RUN sh -c 'touch /app.jar'
ENTRYPOINT ["java","-Xms256m -Xmx512m -XX:CompressedClassSpaceSize=300m -XX:MinHeapFreeRatio=5 -XX:MaxHeapFreeRatio=10 -XX:-TieredCompilation -Xss256k -XX:+UseG1GC -XX:+UseStringDeduplication","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
