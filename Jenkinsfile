pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                // Checkout the current branch automatically in a multibranch pipeline
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image with the build number
                    sh 'docker build -t elshoky/app:${env.BUILD_NUMBER} .'
                }
            }
        }

        stage('Docker Login') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-credentials', usernameVariable: 'USER', passwordVariable: 'PASSWORD')]) {
                    script {
                        // Login to Docker Hub
                        sh 'echo "$PASSWORD" | docker login -u "$USER" --password-stdin'
                    }
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    // Push the Docker image to the registry
                    sh 'docker push elshoky/app:${env.BUILD_NUMBER}'
                }
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}
