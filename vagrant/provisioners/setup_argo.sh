#Make sure the cluster is setup
sleep 1m

#Create the Argo Namespace
runuser -u vagrant -- kubectl create namespace argocd

#Install Argo in the Namespace
runuser -u vagrant -- kubectl apply -f /home/vagrant/argocd.yaml -n argocd

runuser -u vagrant -- kubectl apply -f /home/vagrant/ingress.yaml -n argocd
