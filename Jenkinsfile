pipeline {
    agent any

    environment {
        BUILD_DIR = "build"
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Install Dependencies') {
        steps {
            bat 'gradle clean build'
            }
        }

        stage('Build') {
            steps {
                bat 'npm run build'
            }
        }

        stage('Test') {
            steps {
                bat 'npm test'
            }
        }

        stage('Deploy') {
            steps {
                bat 'docker-compose -f docker-compose.ci.yml up --build -d'
            }
        }
    }

    post {
        always {
            archiveArtifacts artifacts: 'build/**/*'
            junit 'junit.xml' 
        }
    }
}