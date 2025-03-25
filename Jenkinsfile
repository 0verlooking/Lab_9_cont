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
                // Додайте ваші тести тут, наприклад, 'npm test'
                bat 'echo No tests configured yet'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying the application...'
                bat 'node app.js'
            }
        }
    }
}
