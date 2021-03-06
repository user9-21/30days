yellow=`tput bold; tput setaf 3`
green=`tput bold; tput setaf 2`
red_b=`tput bold; tput setab 1`
tput bold; tput setaf 3 ;echo TASK 1; tput sgr0;
gcloud compute networks create griffin-dev-vpc --subnet-mode custom
gcloud compute networks subnets create griffin-dev-wp --network=griffin-dev-vpc --region us-east1 --range=192.168.16.0/20
gcloud compute networks subnets create griffin-dev-mgmt --network=griffin-dev-vpc --region us-east1 --range=192.168.32.0/20
tput bold; tput setaf 3 ;echo TASK 2 ; tput sgr0;
gsutil cp -r gs://cloud-training/gsp321/dm .
cd dm
sed -i s/SET_REGION/us-east1/g prod-network.yaml
gcloud deployment-manager deployments create prod-network     --config=prod-network.yaml
cd ..
tput bold; tput setaf 3 ;echo TASK 3; tput sgr0;
gcloud compute instances create bastion --network-interface=network=griffin-dev-vpc,subnet=griffin-dev-mgmt  --network-interface=network=griffin-prod-vpc,subnet=griffin-prod-mgmt --tags=ssh --zone=us-east1-b
gcloud compute firewall-rules create fw-ssh-dev --source-ranges=0.0.0.0/0 --target-tags ssh --allow=tcp:22 --network=griffin-dev-vpc
gcloud compute firewall-rules create fw-ssh-prod --source-ranges=0.0.0.0/0 --target-tags ssh --allow=tcp:22 --network=griffin-prod-vpc
tput bold; tput setaf 3 ;echo TASK 4; tput sgr0;
tput bold; tput setaf 2 ; echo Here you need to be ALERT; tput sgr0;

gcloud sql instances create griffin-dev-db --root-password password --region=us-east1
tput bold; tput setaf 3 ;echo Instance created; tput sgr0;
tput bold; tput setaf 2 ;echo enter password as password; tput sgr0;
tput bold; tput setaf 2 ;echo Run below mentioned query in mysql; tput sgr0;
tput bold; tput setab 1 ;echo '
CREATE DATABASE wordpress;
GRANT ALL PRIVILEGES ON wordpress.* TO "wp_user"@"%" IDENTIFIED BY "stormwind_rules";
FLUSH PRIVILEGES;
exit
'; tput sgr0;
gcloud sql connect griffin-dev-db

tput bold; tput setaf 3 ;echo TASK 5; tput sgr0;
gcloud container clusters create griffin-dev   --network griffin-dev-vpc   --subnetwork griffin-dev-wp   --machine-type n1-standard-4   --num-nodes 2    --zone us-east1-b
gcloud container clusters get-credentials griffin-dev --zone us-east1-b
cd ~/
gsutil cp -r gs://cloud-training/gsp321/wp-k8s .
tput bold; tput setaf 3 ;echo TASK 6; tput sgr0;
sed -i s/username_goes_here/wp_user/g wp-k8s/wp-env.yaml
sed -i s/password_goes_here/stormwind_rules/g wp-k8s/wp-env.yaml
cd wp-k8s
kubectl create -f wp-env.yaml
gcloud iam service-accounts keys create key.json     --iam-account=cloud-sql-proxy@$GOOGLE_CLOUD_PROJECT.iam.gserviceaccount.com
kubectl create secret generic cloudsql-instance-credentials     --from-file key.json
tput bold; tput setaf 3 ;echo TASK 7;tput sgr0;
sed -i s/YOUR_SQL_INSTANCE/griffin-dev-db/g wp-deployment.yaml
kubectl create -f wp-deployment.yaml
kubectl create -f wp-service.yaml
tput bold; tput setaf 3 ;echo TASK 8; tput sgr0;
tput bold; tput setaf 2 ;echo Do task 8 Manually; tput sgr0;
tput bold; tput setaf 2 ;echo https://console.cloud.google.com/monitoring/uptime; tput sgr0;
tput bold; tput setaf 2 ;echo create uptime check manually; tput sgr0;

tput bold; tput setaf 3 ;echo TASK 9; tput sgr0;
export PROJECT_ID=$(gcloud info --format='value(config.project)')
export FIRSTUSER=$(sed -E 's/MEMBERS: //gm;t;d' <<< $(gcloud projects get-iam-policy $PROJECT_ID --flatten="bindings[].members" --format='table(bindings.members)' --filter="bindings.members:user:student*" |& tail -1))
echo $FIRSTUSER
gcloud projects remove-iam-policy-binding $PROJECT_ID --role='roles/viewer' --member $FIRSTUSER
tput bold; tput setaf 3 ;echo  $FIRSTUSER viewer iam removed; tput sgr0;

export LASTUSER=$(sed -E 's/MEMBERS: //gm;t;d' <<< $(gcloud projects get-iam-policy $PROJECT_ID --flatten="bindings[].members" --format='table(bindings.members)' --filter="bindings.members:user:student*" |& tail -1))
echo $LASTUSER
gcloud projects add-iam-policy-binding $PROJECT_ID --role='roles/editor' --member $LASTUSER
gcloud projects add-iam-policy-binding $PROJECT_ID --role='roles/viewer' --member $FIRSTUSER
tput bold; tput setaf 3 ;echo $LASTUSER viewer iam added; tput sgr0;

tput bold; tput setaf 2 ;echo  if access is not granted to engineer try this code by replacing SECOND_EMAIL; tput sgr0;
tput bold; tput setab 1 ;echo "gcloud projects add-iam-policy-binding $PROJECT_ID --role='roles/editor' --member user:SECOND_EMAIL"; tput sgr0;
kubectl get services
sleep 60
tput bold; tput setaf 2 ;echo Do task 8 Manually; tput sgr0;
tput bold; tput setaf 2 ;echo create uptime check manually and get the score; tput sgr0;
kubectl get services
tput bold; tput setaf 2 ;echo if EXTERNAL IP is still pending try this command until it appear, and use EXTERNAL IP as HOSTNAME for UPTIME CHECK; tput sgr0;
tput bold; tput setab 1 ;echo "kubectl get services"; tput sgr0;
export HOSTNAME=$(kubectl get svc wordpress -o=jsonpath="{.status.loadBalancer.ingress[0].ip}")
tput bold; tput setaf 3 ;echo $HOSTNAME; tput sgr0;
tput bold; tput setaf 3 ;echo use $HOSTNAME as HOSTNAME; tput sgr0;

tput bold; tput setaf 2 ;echo "Navigate Here - https://console.cloud.google.com/monitoring/uptime" ; tput sgr0;


