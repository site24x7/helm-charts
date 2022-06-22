Site24x7
========

Site24x7 is a hosted monitoring platform. 

This Helm chart adds the Site24x7 Agent to all nodes in your kubernetes cluster via a DaemonSet.

Please create a Site24x7 account to install the Kubernetes Monitoring Agent. Sign Up Now for a Free Trial! 


How to add this
===============

Add our charts repository using the helm command line tool:

	helm repo add site24x7 https://site24x7.github.io/helm-charts

	helm repo update


Params
======

device_key: SITE24X7DEVICEKEY 

Your device Key is available under the Site24x7 "Add Server Monitor" page. Log In and navigate to Home > Monitors > Click on the (+) icon > Linux Server Monitoing. 

Site24x7 device key is unique for your account. Alternate device Key can also be generated from your Site24x7 account under Admin > Developer > Device Key.

proxy: NONE

Proxy server required to connect to the Site24x7 servers. Example : user:password@proxyhost:proxyport


Installation Steps
==================
	
   For Helm 3:
   	
   	helm install <RELEASE_NAME> --set site24x7.device_key=<SITE24x7_DEVICE_KEY> site24x7/site24x7
   	
   For helm 2:
   	
   	helm install --name <RELEASE_NAME> --set site24x7.device_key=<SITE24x7_DEVICE_KEY> site24x7/site24x7


Uninstalling the Chart
======================

   To uninstall/delete the <RELEASE_NAME> deployment:
   
   	helm delete <RELEASE_NAME> --purge

   The above command removes all the Kubernetes components associated with the chart and deletes the release.



Related Links
=====
* [Site24x7 Server Monitoring] (https://www.site24x7.com/server-monitoring.html)
* [Site24x7 Signup] (https://www.site24x7.com/signup.html?pack=5&l=en)
* [Site24x7 Help Documentation] (https://www.site24x7.com/help/admin/adding-a-monitor/linux-server-monitoring.html)
