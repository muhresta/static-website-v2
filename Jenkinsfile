pipeline {
    environment{
        registry = "muhresta/web-cafe"
        registryCredential= 'muhresta'
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
                    dockerImage = docker.build registry + ':$BUILD_NUMBER'
                    echo 'Build Image completed'
                }
            }
        }
        stage("Pushing Image") {
            steps {
                script {
                    docker.withRegistry( '', registryCredential) {
                        dockerImage.push()
                    }
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