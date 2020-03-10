# Zabbix XFS quota
Zabbix Template n` scripts for monitoring xfs project quotas 

## Dependences
### HOST
* awk
* sudo
* xfsprogs
* zabbix-agent

## Install
### HOST
1. Add zabbix user to sudoers file (/etc/sudoers):
```
zabbix  ALL=NOPASSWD:   /usr/sbin/xfs_quota
``` 
2. Copy dir *host/opt/zabbix* to */opt/*
```bash
cp host/opt/zabbix /opt
```
3. Copy userparameter file to correct dir
```bash
cp host/etc/zabbix/zabbix_agentd.d/userparameter_xfsquota.conf /etc/zabbix/zabbix_agentd.d/userparameter_xfsquota.conf
```
4. Configure shell scripts to correct paths
```bash
DIR=/media/dados
XFS_QUOTA=/usr/sbin/xfs_quota
AWK=/usr/bin/awk
GREP=/usr/bin/grep
WC=/usr/bin/wc
```
5. Restart zabbix-agent
```bash
systemctl restart zabbix-agent
```
### ZABBIX SERVER
1. Import *zabbix_server/zabbix_xfs_quota-{VERSION}.xml*.
2. Add *XFS QUOTA* to host.
3. Be Happy.