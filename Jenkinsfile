pipeline {
    agent any

    stages {

        stage("Build") {
            agent {
                node {
                    label "linux-ubuntu"
                } 
            }
            steps {
                echo("Build steps isn't needed for HTML & CSS project")
            }
        }
        stage("Test") {
            agent {
                node {
                    label "linux-ubuntu"
                } 
            }
            steps {
                echo("Test steps isn't needed for HTML & CSS project")
            }
        }
        stage("Deploy") {
            agent {
                node {
                    label "linux-ubuntu"
                }
            }
            steps {
                echo("Deploy steps: applying k8s YAML manifest")
            }
        }
    }
}