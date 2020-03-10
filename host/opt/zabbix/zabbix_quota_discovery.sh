#!/bin/bash
#====================================================================#
# zabbix_quota_discovery - Autodiscovery XFS Quotas for Zabbix 
# 
# Diego Neves  - <diego@diegoenves.eti.br - github.com/diegoaceneves/
# 
#
# ----------------------------------------------------------------------------
# "THE BEER-WARE LICENSE" (Revision 42):
# <phk@FreeBSD.ORG> wrote this file. As long as you retain this notice you
# can do whatever you want with this stuff. If we meet some day, and you think
# this stuff is worth it, you can buy me a beer in return Poul-Henning Kamp
# ----------------------------------------------------------------------------

DIR=/media/data
XFS_QUOTA=/usr/sbin/xfs_quota
AWK=/usr/bin/awk
GREP=/usr/bin/grep
WC=/usr/bin/wc

Q=`$WC -l /etc/projid |$AWK '{print $1}'`
i=1

json="{\"data\":["
for quota in `sudo $XFS_QUOTA -x -c 'report -p' $DIR  | $GREP -v \# | $GREP \] | $AWK '{print $1}'`; do
	json=$json"{\"{#QUOTANAME}\":\"$quota\"}"
	let i=i+1
	if [  $i -lt $Q ]; then
		json=$json","
	fi
done
json=$json"]}"
echo $json
