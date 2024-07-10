# Utiliza una imagen base con Maven y JDK preinstalados
FROM maven:3.8.5-openjdk-17 AS build

# Configura el directorio de trabajo
WORKDIR /app

# Copia el archivo de configuración de Maven y las dependencias
COPY pom.xml .

# Descarga las dependencias del proyecto
RUN mvn dependency:go-offline -B

# Copia el código fuente del proyecto
COPY src ./src

# Construye el proyecto
RUN mvn clean package -DskipTests

# Utiliza una imagen más ligera para ejecutar el JAR
FROM amazoncorretto:17-alpine-jdk

# Copia el JAR generado desde la etapa de construcción
COPY --from=build /app/target/*.jar /app.jar

# Exponer el puerto 1010
EXPOSE 1010

# Define el punto de entrada para ejecutar el JAR
ENTRYPOINT ["java", "-jar", "/app.jar"]
