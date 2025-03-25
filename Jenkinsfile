pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                echo 'Building...'
                sh 'docker build -t my-app .'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing...'
                sh 'docker run --rm my-app test-command' // Замініть test-command на реальну команду тестування
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying...'
                sh 'docker stop my-app || true'         // Зупиняє попередній контейнер, якщо він існує
                sh 'docker rm my-app || true'           // Видаляє попередній контейнер, якщо він існує
                sh 'docker run -d --name my-app -p 8080:80 my-app' // Запускає новий контейнер
            }
        }
    }
}
