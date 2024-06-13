pipeline {
    agent any
    environment {
        SONARQUBE_SERVER = 'sonarqube' // Tên của cấu hình SonarQube trong Jenkins
        GITHUB_REPO = 'https://github.com/TranVPhuc/Test-Webhook.git' // Đường dẫn tới repo GitHub của bạn
    }


    stages {
        stage('Clone') {
            steps {
                git url: "${GITHUB_REPO}", branch: 'main'
                echo 'Pull codes from Github success'
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
