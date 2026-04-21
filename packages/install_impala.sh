#!/bin/bash


sudo pacman -S iwd impala

# if I have systemd-networkd servicoe
# create such fileso
#
# ➜  network cat 20-wired.network
# [Match]
# Name=en*
# Name=eth*
#
# [Network]
# DHCP=yes
# ➜  network cat 25-wireless.network
# [Match]
# Name=wl*
#
# [Network]
# DHCP=yes
# IgnoreCarrierLoss=3s
# ➜  network pwd
# /etc/systemd/network
#
#
#
#
#
# creat symbolic link for DNS config
sudo ln -sf /run/systemd/resolvestub-resolv.conf /etc/resolv.conf

#enable two services
# systemd-networkd systemd-resolved
# and start them if you want internet before reboot
#
