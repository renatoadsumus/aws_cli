FROM centos:7

ENV PATH="/opt/puppetlabs/bin/:${PATH}"

### CHAVE DE ACESSO AWS PELO COMMAND LINE -  CLI
ENV ACCESS_KEY ""
ENV SECRET_KEY ""
ENV AWS_ACCESS_KEY_ID ""
ENV AWS_SECRET_ACCESS_KEY ""
### US West (Oregon)
#ENV AWS_DEFAULT_REGION=us-west-2
### US East (N. Virginia)
ENV AWS_DEFAULT_REGION=us-east-1
ENV JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk

RUN yum update -y \
&&  yum install -y wget

### INSTALANDO PIP e AWS EB CLI
RUN yum -y groupinstall development \
&& yum -y install https://centos7.iuscommunity.org/ius-release.rpm \
&& yum -y install python36u \
&& yum install python36u-pip -y \
&& yum install python36u-devel -y \
&& yum install python-pip -y \
&& pip install awscli --upgrade --user

#DOWNLOAD Puppet Development Kit
ADD https://yum.puppetlabs.com/el/7Server/PC1/x86_64/pdk-1.3.2.0-1.el7.x86_64.rpm /opt/

#INSTALL Puppet Development Kit
RUN rpm -i /opt/pdk-1.3.2.0-1.el7.x86_64.rpm

#DOWNLOAD PE client tools
ADD https://pm.puppet.com/pe-client-tools/2018.1.0/18.1.0/repos/el/7/PC1/x86_64/pe-client-tools-18.1.0-1.el7.x86_64.rpm /opt/

#INSTALL PE client tools
RUN rpm -i /opt/pe-client-tools-18.1.0-1.el7.x86_64.rpm

RUN mkdir -p .config/ssl/cert/ \
&& mkdir -p .config/puppetlabs/client-tools/

ENV PATH=~/.local/bin:$PATH

EXPOSE 22 8143 4433 8170

COPY criar_aplicacao_eb.sh  /
RUN chmod +x /criar_aplicacao_eb.sh

COPY criar_bucket_s3.sh  /
RUN chmod +x /criar_bucket_s3.sh

COPY deploy_aplicacao_eb.sh  /
RUN chmod +x /deploy_aplicacao_eb.sh

COPY deploy_bucket_s3.sh  /
RUN chmod +x /deploy_bucket_s3.sh

COPY aws_deploy.sh  /
RUN chmod +x /aws_deploy.sh

CMD ./aws_deploy.sh