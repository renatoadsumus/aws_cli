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
				sh "docker build -t aws_cli:lastet ."                
            }
        }
		
		stage('Run') { 
            steps {
				echo "Executando docker run -it --name aws_container -e AWS_ACCESS_KEY_ID='${params.AWS_ACCESS_ID}' -e AWS_SECRET_ACCESS_KEY='${params.AWS_SECRET_KEY}' aws_cli:lastet /bin/bash"
				echo "Executando docker exec aws_container exec ./criar_s3.sh" 								
				echo "Executando docker exec aws_container exec ./criar_eb.sh" 				
                
            }	
			
        }
        
    }
 }