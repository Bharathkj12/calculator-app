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
     stage('Stop and Remove Old Container') {
            steps {
                script {
                    // Stop and remove the old container (if running)
                    sh '''
                        docker stop my_container || true
                        docker rm my_container || true
                    '''
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
