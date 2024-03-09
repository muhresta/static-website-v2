pipeline {
    agent any

    stages {

        stage("Build") {
            steps {
                echo("Build steps isn't needed for HTML & CSS project")
            }
        }
        stage("Test") {
            steps {
                echo("Test steps isn't needed for HTML & CSS project")
            }
        }
        stage("Deploy") {
            steps {
                echo("Deploy steps: applying k8s YAML manifest")
                sh 'kubectl apply -f Kubernetes/deployment.yaml'
            }
        }
    }
}