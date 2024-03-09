pipeline {
    environment{
        registry = "muhresta/web-cafe"
        dockerImage = ''
    }
    agent any
    stages {
        stage("Source Cloning") {
            steps {
                git 'https://github.com/muhresta/static-website-v2.git'
            }
        }
        stage("Build Image") {
            steps {
                script {
                    dockerImage = docker.build(registry)
                }
            }
        }
        stage("Pushing Image") {
            environment {
                registryCredential= 'dockerhub-credentials'
            }
            steps {
                script {
                    docker.withRegistry( 'https://registry.hub.docker.com', registryCredential) {
                        dockerImage.push()
                    }
                    echo 'Push image completed'
                }
            }
        }
        stage("Deploying container to Kubernetes") {
            steps {
                script {
                    kubernetesDeploy(configs: 'deployment.yaml', 'services.yaml')
                }
            }
        }
    }
}