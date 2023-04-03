pipeline {
   agent any
   stages {
     stage('checkout'){
        steps{
          git credentialsId: 'GitHub_ID', url: 'https://github.com/thedovekana/webcafe-docker.git'
        }
      }
     stage('Build'){
        steps{
          sh 'docker build -t thedove/webcafe:v2 .'
        }
      }
     stage('Push'){
        steps{
          withCredentials([usernamePassword(credentialsId: 'DockerHub_ID', passwordVariable: 'dockerhub_password', usernameVariable: 'dockerhub_username')]) {
            sh "echo ${dockerhub_password} | docker login --username ${dockerhub_username} --password-stdin"
            sh "docker push ${dockerhub_username}/webcafe:v2"}
        }
      }
      
      stage('deploy with ansible playbook'){
        steps{
           ansiblePlaybook credentialsId: 'SSH_Connection_ID', disableHostKeyChecking: true, installation: 'ansible', inventory: 'myhost.yml', playbook: 'webapp-deploy.yml'
        }
      }
    }
}
