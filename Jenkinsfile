pipeline {
    agent any
    tools {
        maven 'Maven'
    }

    stages {
        stage('Clone') {
            steps {
                git 'https://github.com/TranVPhuc/Test-Webhook.git'
                echo 'Pull codes from Github success'
            }
        }

        stage('SonarQube Analysis') {
            steps {
                script {
                    withSonarQubeEnv(installationName: 'LearningSonarQube') {
                        bat '''mvn clean verify sonar:sonar -Dsonar.projectKey=Demo -Dsonar.projectName='Demo' -Dsonar.host.url=http://192.168.74.129:9000 -Dsonar.token=sqp_41aa42c1df91644f502ababc763d60f358904afb''' //port 9000 is default for sonar
                        echo 'SonarQube Analysis Completed'
                    }
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
