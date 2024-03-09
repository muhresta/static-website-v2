pipeline {
    environment{
        dockerimagename = "muhresta/web-cafe"
        DOCKERHUB_CREDENTIALS= credentials('dockerhubcredentials')
    }
    agent any
    stages {
        stage("Checkout Source") {
            steps {
                git 'https://github.com/muhresta/static-website-v2.git'
            }
        }
        stage("Build Image") {
            steps {
                script {
                    sh 'sudo docker build -t muhresta/web-cafe:$BUILD_NUMBER'
                    echo 'Build Image completed'
                }
            }
        }
        stage('Login to Docker Hub') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | sudo docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
                echo 'Login Completed'
            }
        }
        stage("Pushing Image") {
            steps {
                script {
                    sh 'sudo docker push muhresta/web-cafe:$BUILD_NUMBER'
                    echo 'Push image completed'
                }
            }
        }
        stage("Deploying container to Kubernetes") {
            steps {
                script {
                    kubernetesDeploy(configs: 'deployment.yaml', 'service.yaml')
                }
            }
        }
    }
}