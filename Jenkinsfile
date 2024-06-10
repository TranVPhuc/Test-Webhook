pipeline {
    agent any
    stages {
        stage('Clone') {
            steps {
                git 'https://github.com/TranVPhuc/Test-Webhook.git'
            }
        }
    }

    post {
        success {
            mail bcc: '', body: '''Test report: $PROJECT_NAME - Build # $BUILD_NUMBER - $BUILD_STATUS:
            Check console output at $BUILD_URL to view the results.''', cc: '', from: '', replyTo: '', subject: 'Test sending report', to: 'phuctv.2711@gmail.com'
        }
    }
}
