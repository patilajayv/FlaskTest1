pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Set up Python') {
            steps {
                script {
                    def pythonHome = tool 'Python 3.0.1'
                    env.PATH = "${pythonHome}/bin:${env.PATH}"
                }
            }
        }

        stage('Install dependencies') {
            steps {
                sh 'python -m pip install --upgrade pip'
                sh 'pip install -r requirements.txt'
            }
        }

        stage('Run tests') {
            steps {
                sh 'python -m pytest'
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
