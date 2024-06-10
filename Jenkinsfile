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
            echo 'Pipeline succeeded!'
               mail to: 'phuctv.2711@gmail.com',
                 subject: "Pipeline succeeded: ${currentBuild.fullDisplayName}",
                 body: "Great news! The pipeline has completed successfully."
        }
    }
}
