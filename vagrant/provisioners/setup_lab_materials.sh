#Build the Eclipse Workspace
mkdir -p /home/vagrant/Desktop/eclipse-workspace

#Downlaod the Course Materials
ssh-keyscan github.com >> /home/vagrant/.ssh/known_hosts
git -C /home/vagrant/Desktop/ clone https://github.com/Kevin-Bowersox-Courses/continuous-delivery-cloud-native-java-apps-2423655.git

sudo chown -R vagrant /home/vagrant

curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update
sudo apt -y install gh

sudo curl -s "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh" | bash
sudo install -o vagrant -g root -m 0755 kustomize /usr/local/bin/kustomize