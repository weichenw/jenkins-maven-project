pipeline{
    agent any
    stages{
        stage('Build'){
            steps{
                echo "========Create war file========"
                sh  'mvn clean package'
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