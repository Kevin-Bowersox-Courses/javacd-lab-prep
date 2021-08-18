#Get Package
sudo curl -LO https://dl.k8s.io/release/v1.22.0/bin/linux/amd64/kubectl

#Install Package
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

sleep 15s

#Connect Kubectl to the Cluster
kubectl config use-context k3d-javacd-lab-cluster