pipeline {
    agent any     
    stages {		
		
        stage('Build image') { 
            steps {
                echo "Construindo a imagem Docker com AWS CLI" 	
				sh "docker build -t renatoadsumus/aws_cli:latest ."                
            }
        }
		
		stage('Push image') { 
			steps {			
			echo "Deploy nova imagem Docker Hub"				
			//sh "docker login -u renatoadsumus"
			//sh "docker push renatoadsumus/aws_cli:latest"
						
			}			
		}	
        
    }
 }