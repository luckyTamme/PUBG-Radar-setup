#!/bin/bash
apt-get update

rm -r Radar

mkdir Radar
cd Radar

mkdir /opt/Oracle_Java
wget ftp.osuosl.org/pub/funtoo/distfiles/oracle-java/jdk-8u152-linux-x64.tar.gz
tar -xzf jdk-8u152-linux-x64.tar.gz -C /opt/Oracle_Java/
rm jdk-8u152-linux-x64.tar.gz

update-alternatives --install /usr/bin/java java /opt/Oracle_Java/jdk1.8.0_152/bin/java 1
update-alternatives --install /usr/bin/javac javac /opt/Oracle_Java/jdk1.8.0_152/bin/javac 1
update-alternatives --install /usr/bin/javaws javaws /opt/Oracle_Java/jdk1.8.0_152/bin/javaws 1
update-alternatives --install /usr/bin/jar jar /opt/Oracle_Java/jdk1.8.0_152/bin/jar 1

update-alternatives --set java /opt/Oracle_Java/jdk1.8.0_152/bin/java
update-alternatives --set javac /opt/Oracle_Java/jdk1.8.0_152/bin/javac
update-alternatives --set javaws /opt/Oracle_Java/jdk1.8.0_152/bin/javaws
update-alternatives --set jar /opt/Oracle_Java/jdk1.8.0_152/bin/jar

sed -i "s/#crypto.policy=unlimited.*/crypto.policy=unlimited/" "/opt/Oracle_Java/jdk1.8.0_152/jre/lib/security/java.security"

apt-get -y install dsniff
apt-get -y install maven
apt-get -y install git

wget https://raw.githubusercontent.com/zecjy/PUBG_radar_setup/master/update.sh -O update.sh
chmod +x update.sh
./update.sh
