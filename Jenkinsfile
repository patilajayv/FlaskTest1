pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Install dependencies') {
            steps {
                sh 'ls'
                sh 'python -m venv .venv'
                sh 'source .venv/bin/activate'
                sh 'pip3 install -r requirements.txt'
            }
        }

        stage('Run tests') {
            steps {
                sh './venv/bin/activate && python -m pytest'
            }
        }

        stage('Build Docker image') {
            steps {
                script {
                    if (currentBuild.result == 'SUCCESS') {
                        sh 'docker build -t your-image-name .'
                    } else {
                        echo 'Build failed, skipping Docker image build'
                    }
                }
            }
        }
    }
}
