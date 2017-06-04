FROM openjdk:8-jre-alpine
EXPOSE 9411
ADD target/zipkin-service-*.jar /app.jar
CMD java $JAVA_MEM $JAVA_EXT -jar /app.jar
