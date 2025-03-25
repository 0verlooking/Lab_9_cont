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
                    bat 'echo No tests configured, moving forward'
                }
            }
        }
        stage('Deploy') {
            steps {
                echo 'Stopping any existing application on port 3000...'
                bat '''
                    FOR /F "tokens=5" %P IN ('netstat -ano ^| findstr :3000') DO (
                        echo Terminating process with PID: %P
                        taskkill /F /PID %P || echo Process already terminated
                    )
                '''
                echo 'Deploying the application...'
                bat 'node app.js'
            }
        }
    }
    post {
        always {
            echo 'Performing cleanup actions...'
            catchError(buildResult: 'SUCCESS') {
                bat 'taskkill /IM node.exe /F || echo No active Node.js processes found'
            }
        }
        success {
            echo 'Build completed successfully!'
        }
        failure {
            echo 'Build failed. Investigate errors for details.'
        }
    }
}
