FROM openjdk:17-slim

WORKDIR /app

# Copy the JAR file from the build context (host system) into the container
COPY target/calculator-app.jar /app/calculator-app.jar

EXPOSE 8000

# Run the application when the container starts
CMD ["java", "-jar", "calculator-app.jar"]
