pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                git branch: 'master', url: 'https://github.com/Pjoterr/mdolab'
                sh 'npm install'
                sh 'git pull origin master'
            }
            
            post {
                failure {
                    script {
                        env.FAILED = true
                    }  

                    emailext attachLog: true,
                        to:'qsypr1997@gmail.com',
                        subject: "Build failed: ${currentBuild.fullDisplayName}",
                        body: "error ${env.BUILD_URL}"     
                      
                }
                success {
                    mail to: 'qsypr1997@gmail.com',
                        subject: "Build success! ${currentBuild.fullDisplayName}",
                        body: "Build success!"
                }
            }
        }
        stage('Test') {
             steps {
                 script {
                    if ( env.FAILED ) {
                    expression {
                        currentBuild.result = 'ABORTED'
                        error('Failed on build stage!')
                        }
                    }
                }
            }
            post {
                failure {
                    emailext attachLog: true,
                        to:'qsypr1997@gmail.com',
                        subject: "Failed on test stage: ${currentBuild.fullDisplayName}",
                        body: "Error ${env.BUILD_URL}"        
                }
                success {
                    mail to: 'qsypr1997@gmail.com',
                        subject: "Success on testing ${currentBuild.fullDisplayName}",
                        body: "Success on testing ${env.BUILD_URL} "    
                }
            }
        }
        stage('Deploy') {
            steps {
                }
                post {
                    failure {
                         emailext attachLog: true,
                            to:'qsypr1997@gmail.com',
                            subject: "Failed: ${currentBuild.fullDisplayName}",
                            body: "error ${env.BUILD_URL}"        
                    }
                    success {
                        mail to: 'qsypr1997@gmail.com',
                            subject: "Success: ${currentBuild.fullDisplayName}",
                            body: "Success deploy ${env.BUILD_URL} "                        
                    }
                }
        }
    }
}
