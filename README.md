# raspberrypi

This is a git repo that backs up my Raspberry Pi configuration.

## Backup Instructions

1. Clone the repo to `~/GitHub/PrimerFender/raspberrypi/`
1. Execute backup scripts

```bash
cd ~/GitHub/PrimerFender/raspberrypi/scripts/
./backup-pi.sh
```

1. //TODO Refine this process because it works for backup but not restore

## Static IP Address

[Reference Instructions](https://www.abelectronics.co.uk/kb/article/31/raspbian-jessie-or-stretch-static-ip-setup)

### Configuration Summary

//Completed 2018-08-26

```bash
ip addr
# Note IP address, default gateway
sudo vi /etc/dhcpcd.conf
# Append to end of file
interface eth0
static ip_address=192.168.1.3/24
static routers=192.168.1.1
```

## Setup tftp server

### Installation Summary

```bash
sudo apt install tftp-hpa
sudo vi /etc/default/tftpd-hpa
# Edit line
TFTP_OPTIONS="--secure --create"
sudo chown -R tftpd /srv/tftp
sudo service tftpd-hpa restart
```

[Reference Instructions](https://help.ubuntu.com/community/TFTP)

## Cisco Backups

* Depends on `Setup tftp server`

### Execution Summary

```bash
# Router Backup to Pi
ssh router
ciscoasa> enable
ciscoasa# copy running-config startup-config
ciscoasa# copy startup-config tftp:
Address or name of remote host []? 192.168.1.3
Destination filename [startup-config]? startup-config
exit
# WAP Backup to Pi
ssh wap
wap> enable
wap# copy running-config startup-config
wap# copy copy startup-config tftp:
Address or name of remote host []? 192.168.1.3
Destination filename [wap-confg]? wap-confg
exit
# Push backup-files to GitHub
ssh pi
ln /srv/tftp/startup-config ~/GitHub/PrimerFender/raspberrypi/root/srv/tftp/startup-config
ln /srv/tftp/wap-confg ~/GitHub/PrimerFender/raspberrypi/root/srv/tftp/wap-confg
cd ~/GitHub/PrimerFender/raspberrypi/root/srv/tftp
git add startup-config wap-confg
git commit -m "Changes to router or WAP config files..."
git push
```

## Shared Network Printer

// Completed 2018-08-18

[Reference Instructions](https://pimylifeup.com/raspberry-pi-print-server/)

### Install Summary

```bash
sudo apt update
sudo apt upgrade
sudo apt install cups
sudo apt install samba
sudo usermod -a -G lpadmin <user>
sudo cupsctl --remote-any
sudo systemctl restart cups
# Update /etc/samba/smb.conf
sudo systemctl restart smbd
```

### Install on Windows

- `raspberrypi` wasn't being found automatically in Network browser, added via IPP route\share name

`http://raspberrypi:631/printers/Canon_MX490_series`

## Shared Network Scanner

//TODO

[Reference Instructions](http://blog.pi3g.com/2013/04/raspberry-pi-sharing-a-scanner-with-the-network-even-windows/)

## DHCP/DNS Server

[Pi-Hole](https://pi-hole.net/)

```bash
# Install Pi-Hole
wget -O basic-install.sh https://install.pi-hole.net
sudo bash basic-install.sh

# Remove admin password
pihole -a -p

# Pi-Hole installs lighthttpd, but nginx was already intalled (not sure why), so temporarily disable until finding out for sure
sudo systemctl stop nginx
sudo systemctl start lighttpd
```

```bash
# Update router config to use pi-hole and Quad9

```

### Inbound/Outbound Traffic Analyzer for Router

//TODO
