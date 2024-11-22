pipeline {
    agent any

    environment {
        MAVEN_HOME = '/usr/share/maven' // Explicitly set Maven home
        PATH = "${MAVEN_HOME}/bin:${env.PATH}"
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
                    sh "mvn clean install"
                }
            }
        }
        stage('Test') {
            steps {
                script {
                    sh "mvn test"
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
                    sh 'docker run -d -p 8000:8000 calculator12-app'
                }
            }
        }
    }
}
