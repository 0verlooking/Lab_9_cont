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
                bat 'npm run build'  // Replace with your actual build command
            }
        }
    }
    post {
        always {
            echo 'Performing cleanup...'
            bat 'taskkill /IM node.exe /F > nul 2>&1 || echo "No Node.js processes running"'
        }
        success {
            echo 'Build succeeded! Artifacts are ready for deployment.'
        }
        failure {
            echo 'Build failed. Check logs for details.'
        }
    }
}
