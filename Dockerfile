# Use OpenJDK 17 slim version
FROM openjdk:17-slim

# Set working directory
WORKDIR /app

# Copy your JAR file or project files into the container
COPY target/calculator-app.jar /app/calculator-app.jar

# Expose the port your application will run on
EXPOSE 8000

# Command to run your application
CMD ["java", "-jar", "calculator-app.jar"]
