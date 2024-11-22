FROM openjdk:17-slim

WORKDIR /app

# Copy the JAR file from the target directory
COPY target/calculator-app.jar /app/calculator-app.jar

EXPOSE 8000

# Run the application
CMD ["java", "-jar", "calculator-app.jar"]
