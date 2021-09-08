pipeline {
   agent any
	
   stages {
      stage('Build') {
         steps {
            git branch: 'master', url: 'https://github.com/Pjoterr/mdolab.git'
            dir('Docker')
            {
                sh 'docker-compose up build-agent'
            }
           }
              post
              {
                 failure{
                 echo 'Build failed'
                 }
                 success{
                 echo 'Build completed'
                 }
               }
          }
      stage('Test') {
         steps {
            echo 'Testing'
            git branch: 'master', url: 'https://github.com/Pjoterr/mdolab.git'
            dir('Docker'){
                sh 'docker-compose up test-agent'
            }
           }
         post {
           failure {
           mail to:qsypr1997@gmail.com',
           subjecct: "Failed Test stage",
           body: "Test did not pass"
           echo 'Test failded'
           }
           success{
           mail to: 'qsypr1997@gmail.com',
           subject: "Success test",
           body: "Succes Testing"
           echo 'Test complete'
           }
         }
      }

     stage('Deploy'){
       steps{
          echo 'Deplyoing"
          git branch: 'master' , url: 'https://github.com/Pjoterr/mdolab.git'
          dir('Docker'){
           sh 'docker-compose up'
}
         } 
       post {
          failure {
              echo 'Deploy failure'
          }
          success {
              echo 'Deploy complete'
          }
       }
     }
