# raspberrypi

This is a git repo that backs up my Raspberry Pi configuration.

## Backup Instructions

1. Clone the repo to `~/config-backup/raspberrypi/`
1. Setup hard links for the config files mirroring the filesystem stored in the repo

`sudo ln /etc/dhcpcd.conf ~/config-backup/raspberrypi/etc/dhcpcd.conf`

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
ln /srv/tftp/startup-config ~/config-backup/raspberrypi/srv/tftp/startup-config
ln /srv/tftp/wap-confg ~/config-backup/raspberrypi/srv/tftp/wap-confg
cd ~/config-backup/raspberrypi/srv/tftp
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

## Shared Network Scanner

//TODO

[Reference Instructions](http://blog.pi3g.com/2013/04/raspberry-pi-sharing-a-scanner-with-the-network-even-windows/)

## DHCP/DNS Server

//TODO

[Pi-Hole](https://pi-hole.net/)

### Inbound/Outbound Traffic Analyzer for Router

//TODO