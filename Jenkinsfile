pipeline {
    agent any
    stages {
        stage('Clone') {
            steps {
                git 'https://github.com/TranVPhuc/Test-Webhook.git'
            }
        }
        stage('Scan') {
            steps {
                withSonarQubeEnv(installationName: 'LearningSonarQube') {
                    sh '.mvnw clean org.sonarsource.scanner.maven:sonar-maven-plugin:3.9.0.2155:sonar'
                }
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
