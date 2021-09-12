#!/bin/bash

#Initial setup of new server, container, or vm
#Customize to specific disk setup
DATADISK=/dev/sdb

#Store files here
mkdir -p /opt/arweave

#Download miner
cd /opt/arweave
curl -JLO https://github.com/ArweaveTeam/arweave/releases/download/N.2.4.4.0/arweave-2.4.4.0.linux-x86_64.tar.gz
tar xfz arweave-2.4.4.0.linux-x86_64.tar.gz

#mount data dir
mkdir -p /mnt/arweave_data_dir
mount $DATADISK /mnt/arweave_data_dir

#sync nodes
./bin/start data_dir /mnt/arweave_data_dir sync_jobs 80 peer 188.166.200.45 peer 188.166.192.169 peer 163.47.11.64 peer 139.59.51.59 peer 138.197.232.192
