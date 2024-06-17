pipeline {
    agent any
    environment {
        SONARQUBE_SERVER = 'sonarqube' // Tên của cấu hình SonarQube trong Jenkins
    }


    stages {
        stage('Clone') {
            steps {
                git 'https://github.com/TranVPhuc/Test-Webhook.git'
                echo 'Pull codes from Github success'
            }
        }


         stage('SonarQube Analysis') {
            environment {
                scannerHome = tool 'sonarqube'
            }
            steps {
                withSonarQubeEnv('sonarqube') {
                    sh "${scannerHome}/bin/sonar-scanner \
                        -Dsonar.projectKey=Demo \
                        -Dsonar.projectName='Demo' \
                        -Dsonar.host.url=http://192.168.74.129:9000 \
                        -Dsonar.java.binaries=target/classes"
                }
            }
        }
        
            stage('Quality Gate') {
            steps {
                script {
                    def qg = waitForQualityGate()
                    if (qg.status != 'OK') {
                        error "Pipeline aborted due to quality gate failure: ${qg.status}"
                    }
                }
            }
        }
    }

    

    // post {
    //     success {
        
    //         emailext (
    //             to: 'phuctv.2711@gmail.com', 
    //             replyTo: 'phuctv.2711@gmail.com', 
    //             subject: '$DEFAULT_SUBJECT',
    //             body: '$DEFAULT_CONTENT',
    //             mimeType: 'text/html'
    //         );
    
    //     }
    // }
}
