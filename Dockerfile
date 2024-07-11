FROM openjdk:21-jdk-slim
ARG JAR_FILE=target/usersmanagementsystem-0.0.1.jar
COPY ${JAR_FILE} app_usersmanagementsystem.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app_usersmanagementsystem.jar"]