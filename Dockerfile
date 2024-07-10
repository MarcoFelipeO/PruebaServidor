# Etapa de construcción
FROM ubuntu:latest AS build
RUN apt-get update
RUN apt-get install -y maven openjdk-21-jdk
COPY . .
RUN mvn clean package

# Etapa final
FROM ubuntu:latest
RUN apt-get update
RUN apt-get install -y openjdk-21-jdk
COPY --from=build /target/*.jar /app.jar
EXPOSE 1010
ENTRYPOINT ["java","-jar","/app.jar"]
