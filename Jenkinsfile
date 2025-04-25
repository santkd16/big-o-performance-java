pipeline {
    agent any

    environment {
        BUILD_DIR = "build"
    }

    stages {
        

        stage('Install Dependencies') {
        steps {
            bat 'gradle clean build'
            }
        }

        stage('Build') {
            steps {
                bat 'npm install'
                bat 'npm run build'
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