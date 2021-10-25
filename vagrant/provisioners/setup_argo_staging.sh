sleep 5

#Connect Kubectl to the Cluster
runuser -u vagrant -- kubectl config use-context k3d-javacd-lab-cluster-staging

#Create the Argo Namespace
runuser -u vagrant -- kubectl create namespace argocd

#Install Argo in the Namespace
runuser -u vagrant -- kubectl apply -f /home/vagrant/argocd.yaml -n argocd

echo "Monitoring Traefik Setup..."
ingress_ip=""
while [ -z "$ingress_ip" ]; do
	
	sleep 15
	ingress_ip=$(runuser -u vagrant -- kubectl -n kube-system get svc traefik -o jsonpath='{.status.loadBalancer.ingress[0].ip}');
	echo $ingress_ip;

done

echo "External IP is $ingress_ip"

#Create the ingress to the ArgoCd Service
runuser -u vagrant -- kubectl apply -f /home/vagrant/ingress.yaml -n argocd

#Write an entry to the hosts file to adjust networking
sudo sh -c "echo \"$ingress_ip staging.argocd.linkedin.io\" >> /etc/hosts"
sudo sh -c "echo \"$ingress_ip staging.landon.linkedin.io\" >> /etc/hosts"

STGARGOPWD=""
while [ -z "$STGARGOPWD" ]; do
	
	sleep 15
	STGARGOPWD=$(runuser -u vagrant -- kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d)
	echo "Fetching ArgoCD password"
	
done

argocd login staging.argocd.linkedin.io --username admin --password ${STGARGOPWD} --insecure
argocd --server=staging.argocd.linkedin.io --insecure account update-password --account admin --current-password ${STGARGOPWD} --new-password admin

