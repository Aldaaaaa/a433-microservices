pipeline {
    agent any

    stages {
        stage('Lint Dockerfile') {
            steps {
                script {
                    sh 'docker run --rm -i hadolint/hadolint < Dockerfile'
                }
            }
        }

        stage('Test App') {
            steps {
                script {
                    sh 'go test -v -short --count=1 $(go list ./...)'
                }
            }
        }

        stage('Build and Push App') {
            steps {
                script {
                    sh './build_push_image_karsajobs.sh'
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                script {
                    sh 'kubectl apply -f kubernetes/backend/karsajobs-service.yml -f kubernetes/backend/karsajobs-deployment.yml'
                }
            }
        }

        stage('Deploy Monitoring') {
            steps {
                script {
                    sh 'kubectl apply -f kubernetes/monitoring'
                }
            }
        }

        stage('Deploy Grafana Dashboard') {
            steps {
                script {
                    sh 'helm install grafana -n monitoring stable/grafana -f kubernetes/monitoring/grafana-values.yaml'
                }
            }
        }
    }
}