pipeline {
    agent any     
    stages {		
		
        stage('Build image') { 
            steps {
                echo "Construindo a imagem Docker com AWS CLI" 	
				sh "docker build -t renatoadsumus/aws_cli:1.0 ."                
            }
        }
		
		stage('Push image') { 
			steps {			
			echo "Deploy nova imagem Docker Hub"				
			sh "docker login --username=renatoadsumus --password=${DOCKER_HUB_PASS}"
			sh "docker push renatoadsumus/aws_cli:1.0"
						
			}			
		}	
        
    }
 }