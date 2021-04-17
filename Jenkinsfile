pipeline {
    agent any
       environment {
           PATH="/usr/bin/mvn/bin:$PATH"
       }
    stages {
        stage ('build') {
            steps {
               git credentialsId: 'github', url: 'https://github.com/preethamyj/java-hello-world-with-maven.git'
            }
        }
        stage ('mvnbuild') {
            steps {
                sh 'mvn clean install'
            }
        }
        stage ('build dockerimage'){
            steps {
                sh 'docker build -t docker635067/test:preethu .'
                // sh 'docker tag jar docker635067/test:hub'
            }
        }
        stage ('push docker image') {
            steps {
                sh 'cat ~/my_password.txt | docker login --username docker635067 --password-stdin'
                sh 'docker push docker635067/test:preethu'
            }
        }
        stage ('deploy image') {
            steps {
                sshagent(['dockermaster']) {
                    sh 'ssh -o StrictHostKeyChecking=no ubuntu@172.31.33.180 sudo docker run -it -d -p 8085:8080 docker635067/test:preethu'
                }
            }            
        }
    } 
}
