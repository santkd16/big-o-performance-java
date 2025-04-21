pipeline {
    agent any

    environment {
        BUILD_DIR = "build"  // React usa 'build' en lugar de 'dist'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }

        stage('Build') {
            steps {
                sh 'npm run build'
            }
        }

        stage('Test') {
            steps {
                sh 'npm test'
            }
        }

        stage('Deploy') {
            steps {
                sh 'docker-compose -f docker-compose.ci.yml up --build -d'
            }
        }
    }

    post {
        always {
            archiveArtifacts artifacts: 'build/**/*'
            junit 'junit.xml'  # Si tienes tests
        }
    }
}