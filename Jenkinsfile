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
                catchError(buildResult: 'SUCCESS', stageResult: 'UNSTABLE') {
                    echo 'Testing the application...'
                    bat 'echo "No tests configured"'
                }
            }
        }
        stage('Deploy Prep') {
            steps {
                echo 'Preparing for deployment...'
                bat 'echo "Deployment preparation complete"'
            }
        }
    }
    post {
        always {
            echo 'Performing cleanup...'
            bat '@echo off & taskkill /IM node.exe /F > nul 2>&1 & exit 0'
        }
        success {
            echo 'Build succeeded! Artifacts are ready for deployment.'
        }
        failure {
            echo 'Build failed. Check logs for details.'
        }
    }
}
