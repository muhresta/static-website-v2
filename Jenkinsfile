pipeline {
    environment{
        dockerimagename = "muhresta/web-cafe"
        dockerImage = ""
    }
    agent any
    stages {
        stage("Checkout Source") {
            steps {
                git 'https://github.com:muhresta/static-website-v2.git'
            }
        }
        stage("Build Image") {
            steps {
                script {
                    dockerImage = docker.build dockerimagename
                }
            }
        }
        stage("Pushing Image") {
            environment {
                    registryCredential = "dockerhub-credentials"
            }
            steps {
                script {
                    docker.withRegistry( 'https://registry.hub.docker.com', registryCredential )
                        dockerImage.push("latest")
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