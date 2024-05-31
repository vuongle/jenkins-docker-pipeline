pipeline{
    agent any
    environment{
        DOCKER_IMAGE = "vuongle/nodejs-test"
        DOCKER_TAG = "v3"
    }
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
                    sh "docker build -t ${DOCKER_IMAGE}:${DOCKER_TAG} ."
                    sh "docker push ${DOCKER_IMAGE}:${DOCKER_TAG}"
                }

                // remove image after pushing
                sh "docker image rm ${DOCKER_IMAGE}:${DOCKER_TAG}"
            }
        }
    }
    post{
        always{
            mail bcc: '', body: 'This email is sent to you when there is a build triggered.', cc: '', from: '', replyTo: '', subject: 'Jenkins Build Notification', to: 'le.quang.vuong@quantic.com.vn'
        }
    }
}