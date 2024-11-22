pipeline {
    agent any

    tools {
        maven 'Maven 3' // This refers to the Maven installation name configured in Jenkins
        jdk 'jdk-17' // This refers to the JDK installation name configured in Jenkins
    }

    environment {
        MAVEN_HOME = tool name: 'M3', type: 'Maven'
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
