#Generate the SSH Key
runuser -u vagrant -- ssh-keygen -t rsa -C "kmb385@gmail.com" -q -P "" -f "/home/vagrant/.ssh/id_rsa"

#Add to SSH agent
runuser -u vagrant -- eval "$(ssh-agent -s)"
runuser -u vagrant -- ssh-add home/vagrant/.ssh/id_rsa

cat /home/vagrant/.ssh/id_rsa > /home/vagrant/private.key
cat /home/vagrant/.ssh/id_rsa.pub > /home/vagrant/public.key

