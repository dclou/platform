FROM openjdk:8-jre-alpine
EXPOSE 7070
ADD target/admin-service-*.jar /app.jar
CMD java $JAVA_MEM $JAVA_EXT -jar /app.jar
