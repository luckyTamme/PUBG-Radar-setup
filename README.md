### Fast setup for the PUBG Radar on linux


# ***CURRENTLY OUTDATED***

It installs the latest version from EmberVulpix, which supports the current encrytion. All requirements like java are also installed

**To run the setup you simply need to execute this commands in your terminal**
```
wget https://raw.githubusercontent.com/zecjy/PUBG-Radar-setup/master/setup.sh
sudo chmod +x setup.sh
sudo ./setup.sh
```

**In the setup process you will be asked for 3 IP addresses, your gamePC where PUBG runs, the RadarPC IP on which the setup runs and your router IP which is displayed as gateway.
On windows, use `ipconfig` in cmd to find your IP and gateway, and on linux use `ifconfig`. Your interface will most likely be `ens33` or `enp3s0`, don't choose `lo`.
When your asked for RAM, look in the `Mem:` line in collum `free`. Choose a lower value e.g. 4.2G -> type `4g`.**

* *Both systems need to be connected via the **same medium** (WiFi|WiFi oder LAN|LAN) and in the **same network** (e.g. 192.168.0.2 + 192.168.0.3) !*

The setup installs the radar in the `Radar` folder. There will be `update.sh`, `create_run.sh` and `run.sh`.

**To start the Radar execute:**
```
cd Radar
sudo ./run.sh
```
*If you want to see the arpspoof output (e.g. you want to see if your ip setup works) use `sudo ./run.sh --show_arpspoof`*

**If you want to update to the latest version or switch between 4k and 8k map:**
```
cd Radar
sudo ./update.sh
```
While the 8k map is more detailed than the 4k map, the 8k map may cause performance issues, especially on lower-end PCs and Virtual Machines. 

**If an IP changed or your run.sh is no longer working right:**
```
cd Radar
sudo ./create_run.sh
```

**FAQ:**
**Q:** When I try to run the radar, it returns an error.
**A:** You likely set up something wrong. Make sure the IP of your Radar PC is in the same range as your gateway IP. If it isn't, change the network type of your VM in Virtualbox manager to "Bridge adapter" instead of "NAT", then run:
```
cd Radar
sudo ./create_run.sh
```
If that doesn't resolve the issue, try to run setup.sh again.

**Q:** I get the "encryption token", but the radar is gray.
**A:** This could be caused by various factors. First make sure you have allocated enough RAM for the radar to run (and that you actually have enough free RAM available in your VM). If you're sure you have enough RAM allocated, but the issue persists, it's possible that your router is blocking ARP spoofing. In that case your best guess would be to disable the feature that prevents the ARP spofing from working in your router settings, or to temporarily switch to a router which doesn't block ARP spoofing. 

**Credits to:**
* *EmberVulpix: https://github.com/EmberVulpix/Gaydar*
* *sm00thelf for the basic script: https://high-minded.net/members/sm00thelf.40217/*
