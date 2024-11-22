pipeline {
    agent any

    tools {
        maven 'Maven 3'  // Use the exact name of your Maven installation here
        jdk 'jdk-17'     // Ensure the JDK name matches the one configured
    }

    environment {
        MAVEN_HOME = tool name: 'Maven 3', type: 'Maven'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Build') {
            steps {
                script {
                    sh "${MAVEN_HOME}/bin/mvn clean install"
                }
            }
        }
        stage('Test') {
            steps {
                script {
                    sh "${MAVEN_HOME}/bin/mvn test"
                }
            }
        }
        stage('Docker Build') {
            steps {
                script {
                    sh 'docker build -t calculator-app .'
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    sh 'docker run -d -p 8000:8000 calculator-app'
                }
            }
        }
    }
}
