pipeline {
    agent any
    environment {
        SONARQUBE_SERVER = 'sonarqube' // Tên của cấu hình SonarQube trong Jenkins
        AWS_ACCESS_KEY_ID     = credentials('aws-access-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
    }


    stages {
        stage('Clone') {
            steps {
                git 'https://github.com/TranVPhuc/Test-Webhook.git'
                echo 'Pull codes from Github success'
            }
        }

        stage('Terraform Init') {
            steps {
                // Khởi tạo Terraform
                sh 'terraform init'
            }
        }

        stage('Terraform Plan') {
            steps {
                // Lập kế hoạch triển khai Terraform
                sh 'terraform plan'
            }
        }

        stage('Terraform Apply') {
            steps {
                // Triển khai Terraform
                sh 'terraform apply -auto-approve'
            }


        //  stage('SonarQube Analysis') {
        //     environment {
        //         scannerHome = tool 'sonarqube'
        //     }
        //     steps {
        //         withSonarQubeEnv('sonarqube') {
        //             sh "${scannerHome}/bin/sonar-scanner \
        //                 -Dsonar.projectKey=Demo \
        //                 -Dsonar.projectName='Demo' \
        //                 -Dsonar.host.url=http://192.168.74.129:9000 \
        //                 -Dsonar.java.binaries=target/classes"
        //         }
        //     }
        // }
        
        //     stage('Quality Gate') {
        //     steps {
        //         script {
        //             def qg = waitForQualityGate()
        //             if (qg.status != 'OK') {
        //                 error "Pipeline aborted due to quality gate failure: ${qg.status}"
        //             }
        //         }
        //     }
        // }
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
        failure {
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
