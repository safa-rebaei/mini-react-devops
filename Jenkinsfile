pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Install') {
            steps {
                sh 'npm ci'
            }
        }
        stage('Build') {
            steps {
                sh 'npm run build'
            }
        }
        stage('Docker Build') {
            steps {
                sh 'docker build -t react-app:latest .'
            }
        }
        stage('Docker Run') {
            steps {
                sh 'docker run -d --name react-test -p 80:80 react-app:latest'
                sleep(time: 5, unit: 'SECONDS')
            }
        }
        stage('Smoke Test') {
            steps {
                sh './smoke-test.sh'
            }
        }
        stage('Cleanup') {
            steps {
                sh 'docker stop react-test || true'
                sh 'docker rm react-test || true'
            }
        }
    }
}