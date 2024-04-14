pipeline {
    agent any

    environment {
        AWS_DEFAULT_REGION = 'aws-east-1'
        AWS_ACCESS_KEY_ID = credentials('aws_access_key_id')
        AWS_SECRET_ACCESS_KEY = credentials('aws_secret_key_id')
        ECR_REPO_URL = 'public.ecr.aws/e9k0p2n3/jenkins'
        DOCKER_IMAGE_TAG = 'latest'
        DOCKERFILE_PATH = 'new-project/Dockerfile'
    }

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    def dockerImage = docker.build("your_image_name:${DOCKER_IMAGE_TAG}", "-f ${DOCKERFILE_PATH} .")
                }
            }
        }

        stage('Push to ECR') {
            steps {
                script {
                    docker.withRegistry(ECR_REPO_URL, 'ecr:your_ecr_credentials_id') {
                        dockerImage.push("${DOCKER_IMAGE_TAG}")
                    }
                }
            }
        }
    }

    post {
        always {
            script {
                dockerImage.push("${DOCKER_IMAGE_TAG}")
            }
        }
    }
}

