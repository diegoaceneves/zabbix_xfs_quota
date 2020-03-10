#!/bin/bash
#====================================================================#
# zabbix_quota_percent Show total size of XFS Quotas on zabbix 
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

QUOTA=`sudo $XFS_QUOTA -x -c 'report -p' $DIR | grep $1`
echo $QUOTA | $AWK '{print $3}'
