pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/elshoky/jenkins-test.git'
            }
        }
        
        stage('Run Script') {
            steps {
                script {
                    sh 'chmod +x ./hello.sh'
                    sh './hello.sh'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image with the specified name and build number
                    sh 'docker build . -t elshoky/app:$BUILD_NUMBER '
                }
            }
        }

        stage('Docker Login') {
            steps {
                script {
                    // Use USER and PASSWORD environment variables for Docker login
                    sh 'echo "$PASSWORD" | docker login -u "$USER" --password-stdin'
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    // Push Docker image with the build number tag
                    sh 'docker push elshoky/app:$BUILD_NUMBER'
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
