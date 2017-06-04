FROM openjdk:8-jre-alpine
EXPOSE 8080
ADD target/gateway-service-*.jar /app.jar
CMD java $JAVA_MEM $JAVA_EXT -jar /app.jar
