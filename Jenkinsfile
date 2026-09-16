pipeline {
    agent any
    environment {
        IMAGE_NAME = 'jenkins-pipeline'
        CONTAINER_NAME = 'jenkins-pipeline-container'

    }
    stages {
        stage('Checkout Code') {
            steps {
                echo 'Checking out Code ...'
                checkout scm
            }
        }
        stage('Build Docker Image') {
            steps {
                echo 'Building Docker Image ...'
                sh 'docker build -t $IMAGE_NAME .'
            }
        }
        stage('Remove Old Container') {
            steps {
                echo 'Removing Old Container ...'
                sh 'docker rm -f $CONTAINER_NAME || true'
            }
        }
        stage('Run Docker Container') {
            steps {
                echo 'Running Docker Container ...'
                sh 'docker run -d -p 8081:80 $IMAGE_NAME'
            }
        }
        stage('Verify Deployment'){
            steps{
                sh 'docker ps'
            }
        }
    }
    post {
        success {
            echo 'Success ! Pipeline Built'
        }
        failure {
            echo 'Failed !'
        }
        always {
            echo 'Pipeline Finished !'
        }
    }
}