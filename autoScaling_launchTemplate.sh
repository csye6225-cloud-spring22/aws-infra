#!/bin/bash
cd /home/ec2-user
touch .env
echo DB_DATABASE="${DB_DATABASE}" >> .env
echo DB_USERNAME="${DB_USERNAME}" >> .env
echo DB_PASSWORD="${DB_PASSWORD}" >> .env
echo DB_HOST="${DB_HOST}" >> .env

echo AWS_Bucket_name="${AWS_Bucket_name}" >> .env
# echo NODE_ENV="production" >> .env  
echo PORT="8000" >> .env

sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl \
    -a fetch-config \
    -m ec2 \
    -c file:/home/ec2-user/cloud-watch-config.json \
    -s

sudo systemctl daemon-reload
sudo systemctl enable nginx
sudo systemctl start nginx
sudo systemctl enable webapp
sudo systemctl start webapp
