#Build the Eclipse Workspace
mkdir -p /home/vagrant/Desktop/eclipse-workspace

#Downlaod the Course Materials
ssh-keyscan github.com >> /home/vagrant/.ssh/known_hosts
git -C /home/vagrant/Desktop/ clone https://github.com/kevinbowersox-javacd/course-files.git

mv /home/vagrant/Desktop/course-files/javacd-room-service /home/vagrant/Desktop/eclipse-workspace/javacd-room-service
mv /home/vagrant/Desktop/course-files/javacd-booking-service /home/vagrant/Desktop/eclipse-workspace/javacd-booking-service
mv /home/vagrant/Desktop/course-files/javacd-guest-service /home/vagrant/Desktop/eclipse-workspace/javacd-guest-service
mv /home/vagrant/Desktop/course-files/javacd-hotel-webapp /home/vagrant/Desktop/eclipse-workspace/javacd-hotel-webapp
mv /home/vagrant/Desktop/course-files/javacd-deploy /home/vagrant/Desktop/eclipse-workspace/javacd-deploy

rm -rf /home/vagrant/Desktop/course-files

chown -R vagrant eclipse-workspace

sudo apt -y install hub
