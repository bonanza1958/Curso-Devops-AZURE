pipeline {
  agent any

  tools {
    // Asegúrate de que este nombre coincida con el que configuraste en Jenkins > Global Tool Configuration
    maven 'Maven1'
  }

  stages {
    stage('Check Maven') {
      steps {
        echo 'Verificando instalación de Maven...'
        sh 'which mvn'
        sh 'mvn -v'
      }
    }

    stage('Checkout') {
      steps {
        checkout([$class: 'GitSCM',
          branches: [[name: '*/main']],
          userRemoteConfigs: [[
            url: 'git@github.com:bonanza1958/Curso-Devops-AZURE.git',
            credentialsId: 'ssh-github-key'
          ]]
        ])
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
