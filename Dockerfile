FROM jenkins/jenkins

USER root

RUN apt-get update && \
    apt-get install ansible -y

# Install Docker

RUN apt-get update && \
apt-get autoclean && \
apt-get autoremove && \
apt-get -y install apt-transport-https \
     ca-certificates \
     curl \
     gnupg2 \
     software-properties-common && \
curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg > /tmp/dkey; apt-key add /tmp/dkey && \
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
   $(lsb_release -cs) \
   stable" && \
apt-get update && \
apt-get -y install docker-ce && \
apt-get install zip wget openssh-server  apt-utils sudo -y && \
wget https://releases.hashicorp.com/terraform/0.12.24/terraform_0.12.24_linux_amd64.zip && \
unzip terraform*.zip && \
mv terraform /usr/local/bin

# Compose

RUN curl -L "https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && chmod +x /usr/local/bin/docker-compose

RUN usermod -aG docker jenkins && \
    echo "jenkins:1234" | chpasswd && \
    echo "root:1234"| chpasswd && \
    /etc/init.d/ssh start

USER jenkins
