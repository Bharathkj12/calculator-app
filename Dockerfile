FROM openjdk:17-slim

WORKDIR /app

# Ensure the JAR file exists before copying it
RUN ls -l /target

COPY target/calculator-app.jar /app/calculator-app.jar

EXPOSE 8000

CMD ["java", "-jar", "calculator-app.jar"]
