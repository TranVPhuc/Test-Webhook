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

        stage('build && SonarQube analysis') {
            steps {
                withSonarQubeEnv('sonarqube') {
                    // Optionally use a Maven environment you've configured already
                    withMaven(maven:'Maven 3.9.7') {
                        sh 'mvn clean package sonar:sonar'
                    }
                }
            }
        }
        stage("Quality Gate") {
            steps {
                timeout(time: 1, unit: 'HOURS') {
                    // Parameter indicates whether to set pipeline to UNSTABLE if Quality Gate fails
                    // true = set pipeline to UNSTABLE, false = don't
                    waitForQualityGate abortPipeline: true
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
}
