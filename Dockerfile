# Use an official Maven image with JDK 17 to build the application
FROM maven:3.8.1-openjdk-17 as build

# Set the working directory in the container
WORKDIR /app

# Copy the Maven project files into the container
COPY . .

# Build the application using Maven
RUN mvn clean install

# Use an openjdk 17 image for the final image
FROM openjdk:17-jre-slim

WORKDIR /app

# Copy the jar file from the build stage
COPY --from=build /app/target/calculator-app-1.0-SNAPSHOT.jar /app/calculator-app.jar

# Expose the port the app runs on
EXPOSE 8000

# Run the Java application
CMD ["java", "-jar", "calculator-app.jar"]
