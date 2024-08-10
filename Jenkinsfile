pipeline {
    agent {
        label 'AGENT-1'
    }
    options {
        timeout(time: 30, unit:'MINUTES')
        disableConcurrentBuilds()
        ansiColor('xterm')
    }
    parameters {
        string(name: 'appVersion', defaultValue: '1.0.0', description: 'What is the application version?')
    }
    environment{
        def appVersion = '' //variable declaration
        nexus_url = 'nexus.sdevops.cloud:8081'
    }
  
    stages {
        stage('print the version'){
            steps{
                script{
                    echo "application version: ${params.appVersion}"
                }
            }
        }

        stage('init'){
            steps{
                sh """
                    cd terraform
                    terraform init
                """
            }
        }
        stage('plan'){
            steps{
                sh """
                    cd terraform
                    terraform plan -var="app_version=${params.appVersion}"
                """
            }
        }
        stage('Deploy'){
            steps{
                sh """
                    cd terraform
                    terraform apply --auto-approve -var="app_version=${params.appVersion}"
                """
            }
        }
        
               
    }
          
    post{
        always{
            echo " i will always say hellow again"
            deleteDir()
        }
        success{
            echo " i will run when pipeline is success"
        }
        failure{
            echo " i will run when pipeline is failure"
        }
    }
}
