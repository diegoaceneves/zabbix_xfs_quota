#!/bin/bash
#====================================================================#
# quota.sh - Manage project quota with XFS_QUOTA 
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

DIR=/media/dados
XFS_QUOTA=/usr/sbin/xfs_quota
UN=G

if [ $# != 2  ] ; then
	$XFS_QUOTA -x -c 'report -hp' $DIR | grep -v \#
	read -p "Digite o Setor: " GROUP
	read -p "Digite a nova quota (em GB): " QUOTA
else
	echo "Use: $0 GROUP QUOTA"
	echo "$0 cpd 100G"
fi

COMAND="${XFS_QUOTA} -x -c 'limit -p bsoft=${QUOTA}${UN} bhard=${QUOTA}${UN} ${GROUP}' ${DIR}"
eval $COMAND
