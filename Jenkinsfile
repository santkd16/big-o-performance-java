pipeline {
    agent any

    environment {
        // Configura variables de entorno si es necesario var
        
        BUILD_DIR = "dist" // Carpeta de salida del build
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm // Descarga el código del repositorio
            }
        }

        stage('Install Dependencies') {
            steps {
                bat 'npm install'
            }
        }

        stage('Build') {
            steps {
                bat 'npm run build'
            }
        }

        stage('Archive Artifacts') {
            steps {
                archiveArtifacts artifacts: '${BUILD_DIR}/**/*', fingerprint: true
            }
        }
    }

    post {
        success {
            echo '✅ Build exitoso!'
            // slackSend channel: '#devops', message: "Build exitoso: ${env.JOB_NAME} - ${env.BUILD_URL}"
        }
        failure {
            echo '❌ Build fallido'
            // mail to: 'team@example.com', subject: "Build fallido: ${env.JOB_NAME}", body: "Ver logs: ${env.BUILD_URL}"
        }
    }
}