pipeline {
  agent any
  stages {
    stage('Checkout Source') {
      steps {
        git 'https://github.com/muhresta/static-website-v2'
      }
    }
    stage('Build image') {
      steps{
        script {
          echo 'Building Docker image...'
          sh 'docker build -t muhresta/web-cafe:v1 .'
        }
      }
    }
    stage('Push Image') {
      environment {
        DOCKER_CREDENTIALS = credentials('dockerhub-credentials')
      }
      steps{
        script {
          sh 'docker login --username ${DOCKER_CREDENTIALS_USR} --password ${DOCKER_CREDENTIALS_PSW}'
          sh 'docker push muhresta/web-cafe:v1'
          }
        }
      }
    stage('Deploying container to Kubernetes') {
      steps {
        script {
          sh 'minikube kubectl -- apply -f deployment.yaml'
          sh 'minikube kubectl -- apply -f services.yaml'
        }
      }
    }
  }
}