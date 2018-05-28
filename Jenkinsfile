pipeline {
    agent any 
    parameters {
       
         string(defaultValue: "", description: 'Credencias da AWS', name: 'AWS_ACCESS_KEY_ID')
		 string(defaultValue: "", description: 'Credencias da AWS', name: 'AWS_SECRET_ACCESS_KEY')
    }
    
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