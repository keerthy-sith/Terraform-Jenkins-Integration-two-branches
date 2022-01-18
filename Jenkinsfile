pipeline{
    agent any
    
    tools {
        terraform 'TF'
    }
    
    properties([parameters([string(defaultValue: 'demo-server', description: 'select choices-branch', name: 'Multi-branch'), choice(choices: ['apply', 'destroy'], description: 'Creating and destroy the infra', name: 'action')])])

    environment{
       AWS_DEFAULT_REGION="us-east-1"
   }

    stages{
        stage('Git Checkout'){
            steps{
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/keerthy-sith/Terraform-Jenkins-Integration-two-branches.git']]])
            }
        }    
    }
       
        stage('terraform directory initilization'){
            steps{
                sh label:'init command running',script: 'terraform init'
            }    
        }

        stage('plan'){
            steps{
                sh label:'running plan command',script: 'terraform plan  -input=false -out tfplan -var name=${Name}'
                sh label:'running show command',script: 'terraform show -no-color tfplan > tfplan.txt'
            }
        }
     
        stage('apply'){
            steps{
                withCredentials([aws(credentialsId: '2')]){
                sh label:'running apply command',script: 'terraform ${action} -var name=${Name} --auto-approve'
                }
            }
        }
    }

 post{
    always{
        archiveArtifacts artifacts: 'tfplan.txt'
    }
    success{
        echo 'pipeline runned and server created successfully'
    }
}
}
