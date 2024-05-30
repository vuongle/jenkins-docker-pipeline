pipeline{
    agent any
    triggers{
        githubPush()
    }
    stages{
        stage("Clone"){
            steps{
                git 'https://github.com/vuongle/jenkins-docker-pipeline.git'
            }
        }
        stage("Build Docker"){
            steps {
                withDockerRegistry(credentialsId: "vuongle-dockerhub", url: "https://index.docker.io/v1/"){
                    sh 'docker build -t vuongle/nodejs-test:v1 .'
                    sh 'docker push vuongle/nodejs-test:v1'
                }
            }
        }
    }
}