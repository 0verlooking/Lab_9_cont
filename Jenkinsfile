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
                catchError(buildResult: 'SUCCESS', stageResult: 'UNSTABLE') {
                    echo 'Testing...'
                    bat 'docker run --rm my-app test-command'
                }
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying...'
                bat 'docker stop my-app || true'
                bat 'docker rm my-app || true'
                bat 'docker run -d --name my-app -p 8080:80 my-app'
            }
        }
    }
}
