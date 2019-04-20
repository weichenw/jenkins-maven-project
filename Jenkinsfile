pipeline{
    agent any

    tools {
        maven 'LocalMaven'
    }
    stages{
        stage('Build'){
            steps{
                echo "========Maven Clean======="
                sh 'mvn clean package-v2'
            }
            post{
                always{
                    echo "========always display========"
                }
                success{
                    echo "========Now Archiving========"
                    archiveArtifacts artifacts: '**/target/*.war'
                }
                failure{
                    echo "========A execution failed========"
                }
            }
        }
        stage('Deploy to Staging'){
            steps {
                build job: 'deploy-to-staging-v2'
            }
        }
    }
}