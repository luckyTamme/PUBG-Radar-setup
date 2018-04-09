# Fast setup for the PUBG Radar on linux

It installs the latest 4k version from Albedo, which supports the current encrytion. All requirements like java are also installed

**To run the setup you simply need to execute this commands in your terminal**
`sudo su 
wget https://raw.githubusercontent.com/zecjy/PUBG_radar_setup/master/setup.sh
chmod +x setup.sh
./setup`

**In the setup process you will be asked for 3 IP addresses, your gamePC where PUBG runs, the RadarPC IP on which the setup runs and your router IP which is displayed as gateway.
On windows, use `ipconfig` in cmd to find your IP and gateway, and on linux use `ifconfig`. Your interface will most likely be `ens33` or similar, don't choose `lo`**

* *Both systems need to be connected via LAN and in the same network!*

**To start the Radar execute:**
`sudo ./run.sh`

**Credits to:**
* *Albedo: https://yougame.biz/threads/40333*
* *sm00thelf for the basic script: https://high-minded.net/members/sm00thelf.40217/*
