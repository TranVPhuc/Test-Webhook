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
        
            emailext (
                to: 'phuctv.2711@gmail.com', 
                replyTo: 'phuctv.2711@gmail.com', 
                subject: '$DEFAULT_SUBJECT',
                body: '$DEFAULT_CONTENT',
                mimeType: 'text/html'
            );
    
        }
    }
}
