FROM openjdk:8-jre-alpine
EXPOSE 9991
ADD target/auth-service-*.jar /app.jar
CMD java $JAVA_MEM $JAVA_EXT -jar /app.jar
