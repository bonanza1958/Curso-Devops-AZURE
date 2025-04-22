pipeline {
  agent any

  stages {
    stage('Checkout') {
      steps {
        git url: 'git@github.com:bonanza1958/Curso-Devops-AZURE.git',
            credentialsId: 'ssh-git-credentials'
      }
    }
    stage('Build') {
      steps {
        sh 'mvn clean package'
      }
    }
    stage('Unit Tests') {
      steps {
        sh 'mvn test'
      }
      post {
        always {
          junit 'target/surefire-reports/*.xml'
        }
      }
    }
    stage('Deploy') {
      steps {
        sh './scripts/deploy.sh'
      }
    }
  }
}