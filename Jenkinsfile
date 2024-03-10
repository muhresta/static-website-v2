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
      steps{
        script {
          withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')])
          sh 'docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD'
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