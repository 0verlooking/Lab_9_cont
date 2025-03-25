pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                echo 'Building...'
                bat 'docker build -t my-app .'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing...'
                bat 'docker run --rm my-app test-command' // Замініть test-command на команду тестування
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying...'
                bat 'docker stop my-app || true'         // Зупиняє попередній контейнер
                bat 'docker rm my-app || true'           // Видаляє попередній контейнер
                bat 'docker run -d --name my-app -p 8080:80 my-app' // Запускає новий контейнер
            }
        }
    }
}
