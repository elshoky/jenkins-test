pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                // Checkout the current branch
                checkout scm
            }
        }
        stage('Run Script') {
            steps {
                script {
                    // Execute the hello.sh script
                    sh './hello.sh'
                }
            }
        }
    }
    post {
        always {
            echo "Pipeline execution completed for branch ${env.BRANCH_NAME}."
        }
        success {
            echo "The script ran successfully on branch ${env.BRANCH_NAME}!"
        }
        failure {
            echo "The script failed on branch ${env.BRANCH_NAME}. Check the logs for details."
        }
    }
}
