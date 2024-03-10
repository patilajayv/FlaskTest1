pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }


        stage('Run tests') {
            steps {
                sh './venv/bin/activate && python3 -m pytest'
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
