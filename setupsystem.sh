#!/bin/bash

DATADISK=/dev/sdb

grep -qxF '/etc/sysctl.conf' foo.bar || echo  '/etc/sysctl.conf' >> /etc/sysctl.conf
grep -qxF 'fs.nr_open=9000001' foo.bar || echo 'fs.nr_open=9000001' >> /etc/sysctl.conf
sysctl -p
ulimit -n 900000

sudo tune2fs -O large_dir $DATADISK

#enable huge pages
sysctl -w vm.nr_hugepages=1000
grep -qxF 'vm.nr_hugepages=1000' foo.bar || 'vm.nr_hugepages=1000' echo >> /etc/sysctl.d/local.conf
cat /proc/meminfo | grep HugePages

apt install -y libtinfo5
