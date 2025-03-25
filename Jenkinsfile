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
                echo 'Trying to stop any application using port 3000...'
                bat '''
                for /f "tokens=5" %P in ('netstat -ano ^| findstr :3000') do (
                    echo Attempting to stop process with PID: %P
                    taskkill /F /PID %P >nul 2>&1 || echo Process %P was already stopped.
                )
                '''
                echo 'Deploying the application...'
                bat 'node app.js'
            }
        }
    }
    post {
        always {
            echo 'Performing cleanup...'
            bat '''
            tasklist | findstr /I "node.exe" >nul && (
                echo Cleaning up Node.js processes...
                taskkill /IM node.exe /F >nul 2>&1 || echo Node.js already stopped.
            ) || echo No Node.js processes found.
            '''
        }
        success {
            echo 'Build completed successfully!'
        }
        failure {
            echo 'Build failed. Investigate errors for details.'
        }
    }
}
