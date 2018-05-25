pipeline {
    agent any 
    parameters {
       
         string(defaultValue: "", description: 'Credencias da AWS', name: 'AWS_ACCESS_KEY_ID')
		 string(defaultValue: "", description: 'Credencias da AWS', name: 'AWS_SECRET_ACCESS_KEY')
    }
    
    stages {		
		
        stage('Build') { 
            steps {
                echo "Construindo a imagem Docker com AWS CLI" 	
				sh "docker build -t aws_cli:latest ."                
            }
        }
		
		stage('Run') { 
			steps {			
			echo "Executando Container Docker AWS CLI"				
			sh "docker run -d --name aws_container_geru -e AWS_ACCESS_KEY_ID='${params.AWS_ACCESS_KEY_ID}' -e AWS_SECRET_ACCESS_KEY='${params.AWS_SECRET_ACCESS_KEY}' -e VERSAO='${env.BUILD_ID}' aws_cli:latest"
						
			}			
		}	
        
    }
 }