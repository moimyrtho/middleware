#!/bin/bash

#Author: Myself
#Date: August 2023

#Get updates and Java Install
sudo yum update -y
sudo yum install java-11-openjdk-devel -y
sudo yum install java-11-openjdk -y

#Install wget and download sonarqube
cd /opt
sudo yum install wget -y
sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-10.1.0.73491.zip
#Install unzip
sudo yum install unzip -y

#Extrack the package
sudo unzip /opt/sonarqube-10.1.0.73491.zip

#Change ownership to the user, and change to linux binaries to start service
sudo chown -R vagrant:vagrant /opt/sonarqube-10.1.0.73491.zip
cd /opt/sonarqube-10.1.0.73491.zip/bin/linux-x86-64 
./sonar.sh start

#Add and open tcp port 9000
sudo firewall-cmd --permanent --add-port=9000/tcp
sudo firewall-cmd --reload


