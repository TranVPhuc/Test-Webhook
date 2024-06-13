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
                def scannerHome = tool 'sonarqube';
                withSonarQubeEnv('sonarqube'){
                      sh "${scannerHome}/bin/sonar-scanner \
                            -D sonar.login=admin \
                            -D sonar.password=Lecagod11! \
                            -D sonar.projectKey=Demo \
                            -Dsonar.projectName='Demo' \
                            -D sonar.exclusions=vendor/**,resources/**,**/*.java \
                            -Dsonar.host.url=http://192.168.74.129:9000 \
                            -Dsonar.token=sqp_41aa42c1df91644f502ababc763d60f358904afb"
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
