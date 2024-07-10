FROM amazoncorretto:21-alpine-jdk
EXPOSE 1010
COPY -- from=build /target/usersmanagementsystem-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java", "-jar", "/app.jar"]
