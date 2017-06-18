FROM openjdk:8-jre-alpine
EXPOSE 8888
ADD target/config-service-*.jar /app.jar
CMD java $JAVA_MEM $JAVA_EXT -jar /app.jar
