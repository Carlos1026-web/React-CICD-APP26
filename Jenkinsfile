pipeline {
    agent any
    stages {
        stage('Build'){
            agent {
                docker {
                    image 'docker pull node:22.14.0-slim'
                    reuseNode true
                    }
            }
            steps {
                sh '''
                    ls -la
                    node --version
                    npm --version
                    npm install
                    npm run build
                    ls -la
                '''
            }
        }
        stage('Test'){
            agent {
                docker {
                    image 'docker pull node:22.14.0-slim'
                    reuseNode true
                    }
            }
            steps {
                sh '''
                    test -f build/index.html
                    npm test
                '''
            }
        }
    }
}