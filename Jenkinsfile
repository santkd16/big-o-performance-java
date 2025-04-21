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
        bat 'gradlew.bat clean build'
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
            junit 'junit.xml' 
        }
    }
}