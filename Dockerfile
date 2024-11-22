# Use an official Maven image to build the application
FROM maven:3.8.1-jdk-11 as build

# Set the working directory in the container
WORKDIR /app

# Copy the Maven project files into the container
COPY . .

# Build the application using Maven
RUN mvn clean install

# Run the application in the container
FROM openjdk:11-jre-slim

WORKDIR /app

# Copy the jar file from the build stage
COPY --from=build /app/target/calculator-app-1.0-SNAPSHOT.jar /app/calculator-app.jar

# Expose the port the app runs on
EXPOSE 8000

# Run the Java application
CMD ["java", "-jar", "calculator-app.jar"]
