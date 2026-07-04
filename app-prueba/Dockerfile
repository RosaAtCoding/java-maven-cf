FROM eclipse-temurin:21-jre-alpine

WORKDIR /app

COPY target/app-prueba-1.0-SNAPSHOT.jar app.jar

EXPOSE 8080

CMD ["java", "-jar", "app.jar"]

# docker build -t mi-app-jar:latest .
# docker run -d --name app-prueba -p 8080:8080  mi-app-jar:latest
