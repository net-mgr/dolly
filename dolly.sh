#!/bin/bash

# dolly.sh
# author: Akira Sakamoto
# created at: 2020/10/01

# =====================================================================
#  This script can get a gateway(gw1, gw2)'s config file
# =====================================================================

# get gw's config-file
# curl tftp://[gw's host-name]/config0/[admin_pass]

DATE=`date +"%Y-%m-%d %H:%M:%S"`

send_report()
{
cat << EOF | /usr/sbin/sendmail $SENDTO
From: root
To: $SENDTO
Subject: gw config report

There were changes in gw config.

[result of "git show --stat" command.]
$(git show --stat)

[result of "git diff HEAD^..HEAD" command.]
$(git diff HEAD^..HEAD)
EOF
}

cd /root/dolly
eval "$(cat dolly.env <(echo) <(declare -x))"
curl $GW1 > $GW1_CONF 
curl $GW2 > $GW2_CONF
if [ `git status -s | wc -l` = "0" ]; then
  echo "no change"
else
  echo "changed"
  git add -A
  git commit -m "$DATE"
  git push origin master
  send_report
fi
