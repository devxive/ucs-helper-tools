#!/bin/bash

## Load settings
source /usr/share/univention-helper-tools/core/settings.conf

## Mount NFS shares
##

## Check if mountpoints exists, if not -> create based on array
for i in "${NFSSHAREDIRS[@]}"
do
	mkdir -p $i
done




##### if [ ! -d "${NFSSHAREDIRS}" ]; then

##### mkdir -p ${NFSSHAREDIRS}

##### else

>>>>>>>

##### fi



##### umount /mnt/ucn-1001
##### mount -t nfs 10.10.3.131:/shares/nfs/_files /mnt/ucn-1001








##### [ -d ${NFSSHAREDIRS} ] && echo "Dir exists" || echo "Dir does not exists" mkdir -p ${NFSSHAREDIRS}