pipeline{
    agent any
    tools {
        terraform 'TF'
    }
    stages{
        stage('Git Checkout'){
            steps{
                git credentialsId: '1', url: 'https://github.com/javahometech/iac-demo'
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
