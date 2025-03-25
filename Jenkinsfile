pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                echo 'Installing dependencies...'
                bat 'npm install'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing the application...'
                // Замініть на реальні тести, якщо вони є
                bat 'npm test || echo No tests configured yet'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Stopping any existing application on port 3000...'
                bat 'FOR /F "tokens=5" %P IN (\'netstat -ano ^| findstr :3000\') DO taskkill /F /PID %P || echo No existing process on port 3000'
                echo 'Deploying the application...'
                bat 'node app.js'
            }
        }
    }
    post {
        always {
            echo 'Cleaning up after build...'
            bat 'taskkill /IM node.exe /F || echo No Node.js processes running'
        }
        success {
            echo 'Build completed successfully!'
        }
        failure {
            echo 'Build failed. Please check the logs for errors.'
        }
    }
}
