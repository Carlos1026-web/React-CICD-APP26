pipeline {
    agent any
    environment {
        // NETLIFY_SITE_ID = 'aad182b3-161b-44bd-b993-789b9433e5f1'
        // NETLIFY_AUTH_TOKEN = credentials('myreactapp')
        AWS_DEFAULT_REGION = 'us-east-1'
    }
    stages {
        // stage('Docker'){
        //     steps {
        //         sh '''
        //             docker build -t my-docker-image .
        //         '''
        //     }
        // }
        // stage('Build'){
        //     agent {
        //         docker {
        //             image 'node:24.14.0-alpine'
        //             reuseNode true
        //             }
        //     }
        //     steps {
        //         sh '''
        //             ls -la
        //             node --version
        //             npm --version
        //             npm install
        //             CI='' npm run build
        //             ls -la
        //         '''
        //     }
        // }
        // stage('Test'){
        //     agent {
        //         docker {
        //             image 'node:24.14.0-alpine'
        //             reuseNode true
        //             }
        //     }
        //     steps {
        //         sh '''
        //             test -f build/index.html
        //             npm test
        //         '''
        //     }
        // }
        // stage('Deploy'){
        //     agent {
        //         docker {
        //             // image 'node:24.14.0-alpine'
        //             image 'my-docker-image'
        //             reuseNode true
        //             }
        //     }
        //     steps {
        //         sh '''
        //             # npm install netlify-cli
        //             # node_modules/.bin/netlify --version
        //             # echo "Site ID: $NETLIFY_SITE_ID"
        //             # node_modules/.bin/netlify status
        //             # node_modules/.bin/netlify deploy --site $NETLIFY_SITE_ID --auth $NETLIFY_AUTH_TOKEN --prod --dir=build

        //             netlify --version
        //             echo "Site ID: $NETLIFY_SITE_ID"
        //             netlify status
        //             netlify deploy --prod --dir=build
        //         '''
        //     }
        // }

        // stage('AWS') {
        //     agent {
        //         docker {
        //             image 'amazon/aws-cli'
        //             reuseNode true
        //             args '--entrypoint=""'
        //         }
        //     }
        //     steps {
        //             withCredentials([usernamePassword(credentialsId: 'reactAWS', passwordVariable: 'AWS_SECRET_ACCESS_KEY', usernameVariable: 'AWS_ACCESS_KEY_ID')]) {

        //             sh '''
        //                 aws --version
        //                 aws s3 ls
        //                 echo "Hello, S3!" > index.html
        //                 aws s3 cp index.html s3://react-app-20260325/index.html
        //                 aws s3 sync build/ s3://react-app-20260325/
        //             '''
        //             }
        //         }
        // }

        stage('Build My Image') {
            agent {
                docker {
                    image 'amazon/aws-cli'
                    reuseNode true
                    args '-u root /var/run/docker.sock:/var/run/docker.sock --entrypoint=""'
                }
            }
            steps {
                dnf install -y docker
                docker build -t my-docker-image .
                docker images
            }
        }

        // stage('Deploy to AWS ECS') {
        //     agent {
        //         docker {
        //             image 'amazon/aws-cli'
        //             reuseNode true
        //             args '-u root --entrypoint=""'
        //         }
        //     }
        //     steps {
        //         withCredentials([usernamePassword(credentialsId: 'reactAWS', passwordVariable: 'AWS_SECRET_ACCESS_KEY', usernameVariable: 'AWS_ACCESS_KEY_ID')]) {
        //             sh '''
        //             aws --version

        //             yum install jq -y

        //             LATEST_TD_REVISION=$(aws ecs register-task-definition --cli-input-json file://aws/task-definition.json | jq -r '.taskDefinition.revision')
        //             aws ecs update-service --cluster my-react-cluster-20260330 --service my-react-service-20260330-service-absp0ado --task-definition my-react-task-definition-json-20260330:2
        //             '''
        //         }
        //     }
        // }
    }
}