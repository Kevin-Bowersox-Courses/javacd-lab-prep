#Run the install script
runuser -u vagrant -- wget -q -O - https://raw.githubusercontent.com/rancher/k3d/main/install.sh | TAG=v4.4.7 bash

#Get Package
sudo curl -LO https://dl.k8s.io/release/v1.22.0/bin/linux/amd64/kubectl

#Install Package
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

#Create the Cluster
runuser -u vagrant -- k3d cluster create javacd-lab-cluster-staging --no-lb --wait

sleep 5

#Connect Kubectl to the Cluster
runuser -u vagrant -- kubectl config use-context k3d-javacd-lab-cluster-staging

sleep 5

#Create the Cluster
runuser -u vagrant -- k3d cluster create javacd-lab-cluster-prod --no-lb --wait

sleep 5

#Connect Kubectl to the Cluster
runuser -u vagrant -- kubectl config use-context k3d-javacd-lab-cluster-prod
