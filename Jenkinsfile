pipeline{
    agent any
    tools {
        terraform 'TF'
    }
    stages{
        stage('Git Checkout'){
            steps{
                git branch: 'master', credentialsId: '1', url: 'https://github.com/keerthy-sith/Terraform-Jenkins-Integration-two-branches.git'
            }
        }
        stage('Terraform init'){
            steps{
                sh label: '',script: 'terraform init'
            }
        }
        stage('Terraform apply'){
            steps{
                sh label: '',script: 'terraform apply --auto-approve'
            }
        }
    }    
}
