#!/bin/bash
apt-get update

sysctl -w net.ipv4.ip_forward=1

mkdir PUBG-Radar

cd PUBG-Radar

mkdir /opt/Oracle_Java

wget "ftp.osuosl.org/pub/funtoo/distfiles/oracle-java/jdk-8u152-linux-x64.tar.gz" -p "/opt/Oracle_Java"

tar -xzf "/opt/Oracle_Java/jdk-8u152-linux-x64.tar.gz"

update-alternatives --install "/usr/bin/java" "java" "/opt/Oracle_Java/jdk1.8.0_152/bin/java" 1

update-alternatives --install "/usr/bin/javac" "javac" "/opt/Oracle_Java/jdk1.8.0_152/bin/javac" 1

update-alternatives --install "/usr/bin/javaws" "javaws" "/opt/Oracle_Java/jdk1.8.0_152/bin/javaws" 1

update-alternatives --install "/usr/bin/jar" "jar" "/opt/Oracle_Java/jdk1.8.0_152/bin/jar" 1


update-alternatives --set "java" "/opt/Oracle_Java/jdk1.8.0_152/bin/java"

update-alternatives --set "javac" "/opt/Oracle_Java/jdk1.8.0_152/bin/javac"

update-alternatives --set "javaws" "/opt/Oracle_Java/jdk1.8.0_152/bin/javaws"

update-alternatives --set "jar" "/opt/Oracle_Java/jdk1.8.0_152/bin/jar"

apt-get -y install maven

apt-get -y install dsniff

apt-get -y install git

git clone --single-branch -b linux "https://github.com/Jerry1211/PUBG-Radar"

cd PUBG-Radar

mvn install

cd target/

clear

echo "Ip Adresse des Game PC eingeben (192.168.??.??) und Enter druecken"
read game_ip

clear

echo "Ip Adresse des Router eingeben (192.168.??.??) und Enter druecken"
read router_ip

clear

echo "Ip Adresse des Radar PC eingeben (192.168.??.??) und Enter druecken"
read radar_ip

clear

echo "Gebe den name des zu nutzenden Interface ein"
ls /sys/class/net

echo ""
read interface

clear

cat >run.sh <<EOF
#!/bin/bash
arpspoof -i $interface -t $game_ip $router_ip & >/dev/null
arpspoof -i $interface -t $router_ip $game_ip & >/dev/null
java -jar pubg-radar-1.0-SNAPSHOT-jar-with-dependencies.jar $radar_ip PortFilter $game_ip

EOF

chmod +x run.sh
