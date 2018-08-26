# raspberrypi

This is a git repo that backs up my Raspberry Pi configuration.

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

## TFTP Server
### Cisco Backups

//TODO

## Static IP Address

//TODO