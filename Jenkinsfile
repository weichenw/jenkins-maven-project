pipeline{
    agent any

    tools {
        maven 'LocalMaven'
    }
    stages{
        stage('Build'){
            steps{
                echo "========Maven Clean======="
                sh 'mvn clean package'
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
        stage ('Analysis') {
            steps {
                sh 'mvn --batch-mode -V -U -e checkstyle:checkstyle spotbugs:spotbugs'
            }
        }

        stage('Deploy to Staging'){
            steps {
                build job: 'deploy-to-staging-v2'
            }
        }

        stage ('Deploy to Production'){
            steps{
                timeout(time:5, unit:'DAYS'){
                    input message:'Approve PRODUCTION Deployment?'
                }

                build job: 'deploy-to-prod-v2'
            }
            post {
                success {
                    echo '========Code deployed to Production========'
                }

                failure {
                    echo '========Deployment failed========'
                }
            }
        }
    }

    post {
        always {
            recordIssues enabledForFailure: true, tools: [mavenConsole(), java(), javaDoc()]
            recordIssues enabledForFailure: true, tool: checkStyle()
            recordIssues enabledForFailure: true, tool: spotBugs()
        }
    }
}