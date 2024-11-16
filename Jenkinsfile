pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/elshoky/jenkins-test.git'
            }
        

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t elshoky/app:$BUILD_NUMBER .'
                }
            }
        }

        stage('Docker Login') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-credentials', usernameVariable: 'USER', passwordVariable: 'PASSWORD')]) {
                    script {
                        sh 'echo "$PASSWORD" | docker login -u "$USER" --password-stdin'
                    }
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
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
