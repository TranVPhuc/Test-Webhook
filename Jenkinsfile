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
                scannerHome = tool 'SonarQube Scanner'
            }
            steps {
                withSonarQubeEnv('sonarqube') {
                    sh "${scannerHome}/bin/sonar-scanner \
                        -Dsonar.projectKey=Demo \
                        -Dsonar.sources=src \
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

        stage('Test') {
            steps {
                sh 'mvn test'
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
