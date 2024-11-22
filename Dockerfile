# Use an official Maven image with JDK 17 to build the application
FROM maven:3.8.1-openjdk-17 as build

# Set the working directory in the container
WORKDIR /app

# Copy the Maven project files into the container
COPY . .

# Build the application using Maven
RUN mvn clean install

FROM openjdk:17-slim

WORKDIR /app

COPY target/calculator-app.jar /app/calculator-app.jar

EXPOSE 8000

CMD ["java", "-jar", "calculator-app.jar"]
