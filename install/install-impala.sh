#!/bin/bash

sudo $INSTALL_CMD iwd impala

sudo ln -s ${CONFIGS_DIR}/impala/20-wired.network /etc/systemd/network/20-wired.network
sudo ln -s ${CONFIGS_DIR}/impala/25-wireless.network /etc/systemd/network/25-wireless.network

systemctl enable --now systemd-networkd
systemctl enable --now systemd-resolved

sudo ln -sf /run/systemd/resolvestub-resolv.conf /etc/resolv.conf
