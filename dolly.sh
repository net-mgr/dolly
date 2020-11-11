#!/bin/bash

# dolly.sh
# author: Akira Sakamoto, Kazuki Matsuo, Sho Takasugi
# created at: 2020/10/01

# =====================================================================
#  This script can get a gateway(gw1, gw2)'s config file
# =====================================================================

# get gw's config-file
# curl tftp://[gw's host-name]/config0/[admin_pass]

cd /root/dolly
source dolly.env
for((i=1;i<=${NUM_OF_GW};i++)); do
	gateway_host=GW${i}
	conf_file=GW${i}_CONF
	curl tftp://${!gateway_host} > ${!conf_file}
done;
