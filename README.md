# raspberrypi

This is a git repo that backs up my Raspberry Pi configuration.

## Backup Instructions

1. Clone the repo to `~/config-backup/raspberrypi/`
1. Setup hard links for the config files mirroring the filesystem stored in the repo

`sudo ln /etc/dhcpcd.conf ~/config-backup/respberrypi/etc/dhcpcd.conf`

1. //TODO Refine this process because it works for backup but not restore

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

### Cisco Backups

//TODO

## Static IP Address

[Reference Instructions](https://www.abelectronics.co.uk/kb/article/31/raspbian-jessie-or-stretch-static-ip-setup)

### Configuration Summary

```bash
ip addr
# Note IP address, default gateway
sudo vi /etc/dhcpcd.conf
# Append to end of file
interface eth0
static ip_address=192.168.1.3/24
static routers=192.168.1.1
```

### Inbound/Outbound Traffic Analyzer for Router

//TODO