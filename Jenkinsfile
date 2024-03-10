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
          sh 'docker login -u ${DOCKER_CREDENTIALS_USR} -p ${DOCKER_CREDENTIALS_PWD}'
          sh 'docker push muhresta/web-cafe:v1'
          }
        }
      }
    stage('Deploying container to Kubernetes') {
      steps {
        script {
          kubernetesDeploy(configs: "deployment.yaml", "services.yaml")
        }
      }
    }
  }
}