gcloud config set compute/zone us-central1-a
export PROJECT_ID=$(gcloud info --format='value(config.project)')

gsutil mb gs://$PROJECT_ID/

echo '#!/bin/bash
sudo apt update
sudo apt install apache2 php7.0 -y
sudo service apache2 restart
curl -sSO https://dl.google.com/cloudagents/add-monitoring-agent-repo.sh
sudo bash add-monitoring-agent-repo.sh
sudo apt update
sudo apt install stackdriver-agent -y
curl -sSO https://dl.google.com/cloudagents/add-logging-agent-repo.sh
sudo bash add-logging-agent-repo.sh
sudo apt update
sudo apt install google-fluentd' > script.sh

gsutil  cp script.sh gs://$PROJECT_ID

gcloud compute instances create lamp-1-vm \
  --machine-type=n1-standard-2 \
	--zone=us-central1-a \
	--tags=http \
	--metadata=startup-script-url=gs://$PROJECT_ID/script.sh 
  
  

#---------------------------------------------------------------------------------------------Manual----------------------------------------------------------

tput bold;tput setaf 3; echo '
Now Allow http trapic in lamp-1-vm and click save - https://console.cloud.google.com/compute/instancesEdit/zones/us-central1-a/instances/lamp-1-vm 

Now create Uptime check - https://console.cloud.google.com/monitoring/uptime
 ';tput sgr0;
 
tput bold;tput setaf 6; echo '
 Title: Lamp Uptime Check
 Protocol: HTTP
 Resource Type: Instance
 Applies to: Single, lamp-1-vm
 Path: leave at default
 Check Frequency: 1 min
'
tput bold;tput setaf 3; echo '
Now create alerting policy - https://console.cloud.google.com/monitoring/alerting
';tput sgr0;
tput bold;tput setaf 6; echo '
 Resource Type: VM Instance (gce_instance)
 Metric: Network traffic (gce_instance+1)  -- agent.googleapis.com/interface/traffic:

 Configuration: 
   Condition: is above
   Threshold: 500
   For: 1 minute
   
 Click ADD
 Click  Next
 
 Alert name: Inbound Traffic Alert
 
 Click  Save.

';tput sgr0;
  

#-------------------------------------------------------------------------------------------------Manual----------------------------------------------------------


echo "
# Run this in ssh

sudo apt update
sudo apt install apache2 php7.0 -y

sudo service apache2 restart
curl -sSO https://dl.google.com/cloudagents/add-monitoring-agent-repo.sh
sudo bash add-monitoring-agent-repo.sh
sudo apt update
sudo apt install stackdriver-agent -y
curl -sSO https://dl.google.com/cloudagents/add-logging-agent-repo.sh
sudo bash add-logging-agent-repo.sh
sudo apt update
sudo apt install google-fluentd

# Manual

tput bold;tput setaf 3; echo '
Now Allow http trapic in lamp-1-vm and click save - https://console.cloud.google.com/compute/instancesEdit/zones/us-central1-a/instances/lamp-1-vm 

Now create Uptime check - https://console.cloud.google.com/monitoring/uptime
 ';tput sgr0;
 
tput bold;tput setaf 6; echo '
 Title: Lamp Uptime Check
 Protocol: HTTP
 Resource Type: Instance
 Applies to: Single, lamp-1-vm
 Path: leave at default
 Check Frequency: 1 min
'
tput bold;tput setaf 3; echo '
Now create alerting policy - https://console.cloud.google.com/monitoring/alerting
';tput sgr0;
tput bold;tput setaf 6; echo '
 Resource Type: VM Instance (gce_instance)
 Metric: agent.googleapis.com/interface/traffic

 Configuration: 
 
   Condition: is above
   Threshold: 500
   For: 1 minute
   
 Click ADD
 Click  Next
 
 Alert name: Inbound Traffic Alert
 
 Click  Save.

';tput sgr0;" > laststep.sh

chmod +x laststep.sh
tput bold;tput setaf 6; echo 'permission granted';tput sgr0;

gcloud compute scp laststep.sh lamp-1-vm:~

#--------------------------------------------------------------------------------------------------------

gcloud config set compute/zone us-central1-a
gcloud compute instances list
gcloud compute ssh --zone us-central1-a --quiet lamp-1-vm 
