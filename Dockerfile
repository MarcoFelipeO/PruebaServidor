FROM ubuntu:latest AS build
RUN apt-get update
RUN apt-get install openjdk-21-jdk -y
COPY . .
RUN ./gradlew bootJar --no-daemon
EXPOSE 1010
COPY --from=build /target/*.jar app.jar

ENTRYPOINT["java","-jar","app.jar"]