# javacd-lab-prep

#Instructions
* Install Virtualbox: https://www.virtualbox.org/
* Install Vagrant: https://learn.hashicorp.com/tutorials/vagrant/getting-started-install?in=vagrant/getting-started
* Clone this Git Repository
* Inside the Repository Navigate into the /vagrant directory
* Use this command to install the Vagrant / Virtual Box Guest Plugin
```
vagrant plugin install vagrant-vbguest
```

* Use this command to launch the virtual machine:
```
vagrant up
```

* The machine will take between 7 - 10 minutes to provision.  Login with default credentials [vagrant/vagrant]

* After installation test the following:

  * From Terminal:
    1. Docker: `docker info`
    2. Kubernetes: `kubectl cluster-info`
    3. Helm:  `helm version`
    
 * From a browser window:
    1.  Jenkins:  http://localhost:8080/
    2.  ArgoCd: https://javacd.linkedin.io
    3.  Flagsmith: http://flagsmith.linkedin.io
    
