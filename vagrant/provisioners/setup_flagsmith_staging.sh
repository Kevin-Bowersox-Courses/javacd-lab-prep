sleep 5

#Connect Kubectl to the Cluster
runuser -u vagrant -- kubectl config use-context k3d-javacd-lab-cluster-staging

#Install Helm
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh

#Add the Helm Repo
runuser -u vagrant -- helm repo add flagsmith https://flagsmith.github.io/flagsmith-charts/

#Install the Helm Chart
runuser -u vagrant -- helm install flagsmith flagsmith/flagsmith

#Create the ingress to the Flagsmith Services
runuser -u vagrant -- kubectl apply -f /home/vagrant/flagsmith-ingress.yaml