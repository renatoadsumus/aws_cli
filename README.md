# Ojetivo

Gerar uma imagem com CLI da AWS capaz de criar um ambiente no S3 e Elastic Beanstalk
Criar jobs no Jenkins para automatizar o processo de deploy na AWS

# Como Usar

Primeiro Deploy: docker run -d --rm -e AWS_ACCESS_KEY_ID='' -e AWS_SECRET_ACCESS_KEY='' -e VERSAO='1' -e OPCAO='Novo' renatoadsumus/aws_cli:latest
<br/>
Demais Deploys: Primeiro Deploy: docker run -d --rm -e AWS_ACCESS_KEY_ID='' -e AWS_SECRET_ACCESS_KEY='' -e VERSAO='2' -e OPCAO='Deploy' renatoadsumus/aws_cli:latest
