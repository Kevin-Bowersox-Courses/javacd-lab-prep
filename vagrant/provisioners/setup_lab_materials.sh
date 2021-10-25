#Build the Eclipse Workspace
mkdir -p /home/vagrant/Desktop/eclipse

#Downlaod the Course Materials
ssh-keyscan github.com >> /home/vagrant/.ssh/known_hosts
git -C /home/vagrant/Desktop/ clone https://github.com/Kevin-Bowersox-Courses/continuous-delivery-cloud-native-java-apps-2423655.git

curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update
sudo apt -y install gh

sudo curl -s "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh" | bash
sudo install -o vagrant -g root -m 0755 kustomize /usr/local/bin/kustomize

wget https://mirror.umd.edu/eclipse/technology/epp/downloads/release/2021-09/R/eclipse-jee-2021-09-R-linux-gtk-x86_64.tar.gz -P /home/vagrant/Desktop/eclipse
tar -xf /home/vagrant/Desktop/eclipse/eclipse-jee-2021-09-R-linux-gtk-x86_64.tar.gz -C /home/vagrant/Desktop/eclipse
rm /home/vagrant/Desktop/eclipse/eclipse-jee-2021-09-R-linux-gtk-x86_64.tar.gz

sudo apt install tree

sudo chown -R vagrant /home/vagrant