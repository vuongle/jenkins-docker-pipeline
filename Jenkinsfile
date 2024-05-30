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
        stage("Build"){
            agent any
            steps {
                withDockerRegistry(credentialsId: "vuongle-dockerhub", url: "https://index.docker.io/v1/"){
                    sh 'docker build -t vuongle/nodejs-test:v2 .'
                    sh 'docker push vuongle/nodejs-test:v2'
                }
            }
        }
    }
    post{
        always{
            mail bcc: '', body: 'This email is sent to you when there is a build triggered.', cc: '', from: '', replyTo: '', subject: 'Jenkins Build Notification', to: 'le.quang.vuong@quantic.com.vn'
        }
    }
}