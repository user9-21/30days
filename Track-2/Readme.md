# Track 2


## 1.2 
```
wget --output-document 1.sh https://raw.githubusercontent.com/user9-21/30days/main/Track-2/1.2-Creating_a_Virtual_Machine
chmod +x 1.sh
./1.sh
```

## 1.3 
```
gcloud compute instances create gcelab2 --machine-type n1-standard-2 --zone us-central1-a 
```
## 1.4 
```
wget --output-document 1.sh https://raw.githubusercontent.com/user9-21/30days/main/Track-2/1.4-Kubernetes_Engine_Qwik_Start
chmod +x 1.sh
./1.sh
```

## 1.5 
```
wget --output-document 1.sh https://raw.githubusercontent.com/user9-21/30days/main/Track-2/1.5-Set_Up_Network_and_HTTP_Load_Balancers
chmod +x 1.sh
./1.sh
```

## 1.6
```
wget --output-document 1.sh https://raw.githubusercontent.com/user9-21/30days/main/Track-2/1.6-Create_and_Manage_Cloud_Resources_%3A_Challenge_Lab
chmod +x 1.sh
./1.sh
```

## 2.1
```
wget --output-document 1.sh https://raw.githubusercontent.com/user9-21/30days/main/Track-2/2.1-AI_Platform__Qwik_Start
chmod +x 1.sh
./1.sh
```
```
git clone https://github.com/GoogleCloudPlatform/training-data-analyst
cd training-data-analyst/self-paced-labs/ai-platform-qwikstart
```
## 2.3
```
wget --output-document 1.sh https://raw.githubusercontent.com/user9-21/30days/main/Track-2/2.3-Dataflow__Qwik_Start-Python
chmod +x 1.sh
./1.sh
```
## 2.4
```
wget --output-document 1.sh https://raw.githubusercontent.com/user9-21/30days/main/Track-2/2.4-Dataproc__Qwik_Start-Command_Line
chmod +x 1.sh
./1.sh
```

## 2.5
```
gcloud compute ssh linux-instance --zone=us-central1-a 
```
```
wget --output-document 1.sh https://raw.githubusercontent.com/user9-21/30days/main/Track-2/2.5-Cloud_Natural_Language_API__Qwik_Start
chmod +x 1.sh
./1.sh

```
## 2.6
```
gcloud compute ssh linux-instance --zone us-central1-a
```
### in ssh
```
wget --output-document 1.sh https://raw.githubusercontent.com/user9-21/30days/main/Track-2/2.6-Google_Cloud_Speech_API_Qwik_Start
chmod +x 1.sh
./1.sh

```
## 2.7
```
wget --output-document 1.sh https://raw.githubusercontent.com/user9-21/30days/main/Track-2/2.7-Video_Intelligence__Qwik_Start
chmod +x 1.sh
./1.sh

```
###  Replace URL WITH PREVIOUS STEP
```
curl -s -H 'Content-Type: application/json' -H 'Authorization: Bearer '$(gcloud auth print-access-token)'' 'https://videointelligence.googleapis.com/v1/videos:annotate' -d @request.json
```
## 3.1 
```
wget --output-document 1.sh https://raw.githubusercontent.com/user9-21/30days/main/Track-2/3.1-Introduction_to_SQL_for_BigQuery_and_Cloud_SQL
chmod +x 1.sh
./1.sh

```
### in mysql
```
CREATE DATABASE bike;
exit
```
## 3.2
```
wget --output-document 1.sh https://raw.githubusercontent.com/user9-21/30days/main/Track-2/3.2-BigQuery__Qwik_Start-Command_Line
chmod +x 1.sh
./1.sh

```
## 3.3
```
wget --output-document 1.sh https://raw.githubusercontent.com/user9-21/30days/main/Track-2/3.3-Exploring_Your_Ecommerce_Dataset_with_SQL_in_Google_BigQuery
chmod +x 1.sh
./1.sh

```
## 3.4
```
wget --output-document 1.sh https://raw.githubusercontent.com/user9-21/30days/main/Track-2/3.4-Troubleshooting_Common_SQL_Errors_with_BigQuery
chmod +x 1.sh
./1.sh

```
## 3.6 
```
wget --output-document 1.sh https://raw.githubusercontent.com/user9-21/30days/main/Track-2/3.6-Challenge_Lab__Insights_from_Data_with_BigQuery
chmod +x 1.sh
./1.sh

```
## 4.2 
```
wget --output-document 1.sh https://raw.githubusercontent.com/user9-21/30days/main/Track-2/4.2-Building_an_IoT_Analytics_Pipeline_on_Google_Cloud
chmod +x 1.sh
./1.sh

```
## 4.3 
```
wget --output-document 1.sh https://raw.githubusercontent.com/user9-21/30days/main/Track-2/4.3-ETL_Processing_on_Google_Cloud_Using_Dataflow_and_BigQuery
chmod +x 1.sh
./1.sh

```
## 4.4 
```
wget --output-document 1.sh https://raw.githubusercontent.com/user9-21/30days/main/Track-2/4.4-Predict_Visitor_Purchases_with_a_Classification_Model_in_BQML
chmod +x 1.sh
./1.sh

```
## 4.5 
```
wget --output-document 1.sh https://raw.githubusercontent.com/user9-21/30days/main/Track-2/4.5-Cloud_Composer__Copying_BigQuery_Tables_Across_Different_Locations
chmod +x 1.sh
./1.sh

```
## 4.6 
```
wget --output-document 1.sh https://raw.githubusercontent.com/user9-21/30days/main/Track-2/4.6-Engineer_Data_in_Google_Cloud__Challenge_Lab
chmod +x 1.sh
./1.sh
```
## 5.1 
```
wget --output-document 1.sh https://raw.githubusercontent.com/user9-21/30days/main/Track-2/5.1-Introduction_to_APIs_in_Google
chmod +x 1.sh
./1.sh

```
## 5.2 
```
wget --output-document 1.sh https://raw.githubusercontent.com/user9-21/30days/main/Track-2/5.2-Extract_Analyze_and_Translate_Text_from_Images_with_the_Cloud_ML_APIs
chmod +x 1.sh
./1.sh

```
## 5.3 
```
gcloud compute ssh linux-instance --zone us-central1-a
```
```
wget --output-document 1.sh https://raw.githubusercontent.com/user9-21/30days/main/Track-2/5.3-Classify_Text_into_Categories_with_the_Natural_Language_API
chmod +x 1.sh
./1.sh

```
## 5.4
```
wget --output-document 1.sh https://raw.githubusercontent.com/user9-21/30days/main/Track-2/5.4-Detect_Labels_Faces_and_Landmarks_in_Images_with_the_Cloud_Vision_API
chmod +x 1.sh
./1.sh

```
## 5.5
```
gcloud compute ssh linux-instance --zone us-central1-a  --quiet
```
```
wget --output-document 1.sh https://raw.githubusercontent.com/user9-21/30days/main/Track-2/5.5-Entity_and_Sentiment_Analysis_with_the_Natural_Language_API
chmod +x 1.sh
./1.sh

```
## 5.6 
```
wget --output-document 1.sh https://raw.githubusercontent.com/user9-21/30days/main/Track-2/5.6-Awwvision__Cloud_Vision_API_from_a_Kubernetes_Cluster
chmod +x 1.sh
./1.sh

```
## 5.7
```
wget --output-document 1.sh https://raw.githubusercontent.com/user9-21/30days/main/Track-2/5.7-Integrate_with_Machine_Learning_APIs__Challenge_Lab
chmod +x 1.sh
./1.sh

```
## 6.2
```
gcloud compute ssh --project $GOOGLE_CLOUD_PROJECT   --zone us-central1-a  qwiklabs-tensorflow-notebook -- -L 8080:localhost:8080
```
```
git clone https://github.com/GoogleCloudPlatform/training-data-analyst
```
## 6.3 
```
wget --output-document 1.sh https://raw.githubusercontent.com/user9-21/30days/main/Track-2/6.3-Identifying_Bias_in_Mortgage_Data_using_Cloud_AI_Platform_and_the_What-if_Tool
chmod +x 1.sh
./1.sh

```
## 6.4 
```wget --output-document 1.sh https://raw.githubusercontent.com/user9-21/30days/main/Track-2/6.4-Compare_Cloud_AI_Platform_Models_using_the_What-If_Tool_to_Identify_Potential_Bias
chmod +x 1.sh
./1.sh

```
