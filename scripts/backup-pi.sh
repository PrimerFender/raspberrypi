#!/bin/bash
cp /etc/dhcpcd.conf ../root/etc/
cp /etc/default/tftpd-hpa ../root/etc/default/
sudo cp /etc/samba/smb.conf ../root/etc/samba/
cp /srv/tftp/* ../root/srv/tftp/
