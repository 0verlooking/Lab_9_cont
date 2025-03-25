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
                netstat -ano | findstr :3000 > nul && (
                    set PID=
                    for /f "tokens=5" %P in ('netstat -ano ^| findstr :3000') do set PID=%P
                    if defined PID taskkill /F /PID %PID > nul 2>&1 || echo Failed to terminate PID %PID.
                ) || echo No process is using port 3000.
                '''
                echo 'Deploying the application...'
                bat 'node app.js'
            }
        }
    }
    post {
        always {
            echo 'Performing cleanup...'
            catchError(buildResult: 'SUCCESS') {
                bat '''
                tasklist | findstr /I "node.exe" > nul && (
                    echo Terminating Node.js processes...
                    taskkill /IM node.exe /F > nul 2>&1 || echo Node.js process already stopped.
                ) || echo No Node.js processes running.
                '''
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
