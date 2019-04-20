pipeline{
    agent any
    tools {
        maven 'LocalMaven'
    }
    stages{
        stage('Build'){
            steps{
                echo "========Env Variable======="
                echo env.PATH
                echo "========Create war file========"
                sh  'mvn clean package'
                echo "========Docker image build========="
                sh "docker build . -t tomcatwebapp:${env.BUILD_ID}"
            }
            post{
                always{
                    echo "========always========"
                }
                success{
                    echo "========A executed successfully========"
                }
                failure{
                    echo "========A execution failed========"
                }
            }
        }
    }
}