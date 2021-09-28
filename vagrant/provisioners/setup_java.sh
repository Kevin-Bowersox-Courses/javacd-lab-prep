#Install Java
sudo apt -y install openjdk-11-jdk

#Install Eclipse
sudo snap install --classic eclipse

#Install Jenkins
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > \
    /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update
sudo apt-get -y install jenkins

echo "Skipping the initial setup"
echo 'JAVA_ARGS="-Djenkins.install.runSetupWizard=false"' >> /etc/default/jenkins

echo "Setting up users"
sudo rm -rf /var/lib/jenkins/init.groovy.d
sudo mkdir -m 777 /var/lib/jenkins/init.groovy.d
sudo cp -v /home/vagrant/admin.groovy /var/lib/jenkins/init.groovy.d/

echo "Jenkins Start"
sudo service jenkins start

sleep 1m

#Get the CLI Plugin
wget http://localhost:8080/jnlpJars/jenkins-cli.jar -P /home/vagrant


echo "Setup Jenkins Plugins"


#Install Plugins
java -jar /home/vagrant/jenkins-cli.jar -s http://localhost:8080/ -auth admin:admin install-plugin $(cat plugins.txt | tr '\n' ' ')

#Restart Jenkins Service
echo "Jenkins Restart"
sudo service jenkins restart

sleep 1m