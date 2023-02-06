#!/bin/bash
apt-get update -y
apt-get install -y openjdk-8-jdk
apt-get install -y maven
apt-get install -y tomcat9
git clone https://github.com/vnabok/Geocit134.git
cd Geocit134/
sed -i 's/^\(db\.url\s*=\s*\).*$/\db\.url=\jdbc\:postgresql\:\/\/${rds_endpoint}\/ss_demo_1/' src/main/resources/application.properties
sed -i 's/^\(url\s*=\s*\).*$/url\=\jdbc\:postgresql\:\/\/${rds_endpoint}\/ss_demo_1/' src/main/resources/application.properties
sed -i 's/^\(referenceUrl\s*=\s*\).*$/referenceUrl\=\jdbc\:postgresql\:\/\/${rds_endpoint}\/ss_demo_1/' src/main/resources/application.properties
mkdir /usr/share/tomcat9/webapps/
mkdir /usr/share/tomcat9/logs/
mvn install
cp target/citizen.war /usr/share/tomcat9/webapps/
cp target/citizen.war /var/lib/tomcat9/webapps/
/usr/share/tomcat9/bin/startup.sh
