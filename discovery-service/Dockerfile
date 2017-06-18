FROM openjdk:8-jre-alpine
EXPOSE 8761
ADD target/discovery-service-*.jar /app.jar
CMD java $JAVA_MEM $JAVA_EXT -jar /app.jar
