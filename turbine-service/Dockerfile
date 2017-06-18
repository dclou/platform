FROM openjdk:8-jre-alpine
EXPOSE 8485
ADD target/turbine-service-*.jar /app.jar
CMD java $JAVA_MEM $JAVA_EXT -jar /app.jar
