pipeline {
    agent any
    environment {
        NETLIFY_SITE_ID = 'aad182b3-161b-44bd-b993-789b9433e5f1'
        NETLIFY_AUTH_TOKEN = credentials('myreactapp')
    }
    stages {
        stage('Docker'){
            steps {
                sh '''
                    docker build -t my-docker-image .
                '''
            }
        }
        stage('Build'){
            agent {
                docker {
                    image 'node:24.14.0-alpine'
                    reuseNode true
                    }
            }
            steps {
                sh '''
                    ls -la
                    node --version
                    npm --version
                    npm install
                    CI='' npm run build
                    ls -la
                '''
            }
        }
        stage('Test'){
            agent {
                docker {
                    image 'node:24.14.0-alpine'
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
        stage('Deploy'){
            agent {
                docker {
                    // image 'node:24.14.0-alpine'
                    image 'my-docker-image'
                    reuseNode true
                    }
            }
            steps {
                sh '''
                    # npm install netlify-cli
                    # node_modules/.bin/netlify --version
                    # echo "Site ID: $NETLIFY_SITE_ID"
                    # node_modules/.bin/netlify status
                    # node_modules/.bin/netlify deploy --site $NETLIFY_SITE_ID --auth $NETLIFY_AUTH_TOKEN --prod --dir=build

                    netlify --version
                    echo "Site ID: $NETLIFY_SITE_ID"
                    netlify status
                    netlify deploy --prod --dir=build
                '''
            }
        }
    }
}