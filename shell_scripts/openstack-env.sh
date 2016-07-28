#!/bin/bash
#Create openstack enviroment for cinder-nfs-plugin
fuel plugins --install /tmp/nfs-service*
fuel env create --name cinder_nfs_ci --rel 2 --net-segment-type vlan
env=$(fuel env | grep cinder_nfs_ci)
env_id=${env:0:1}
#This part make plugin enabled in fuel env
fuel --env $env_id settings --download
python /root/settings.py
fuel --env $env_id settings --upload
#
#Set node roles
node_ids=$(fuel nodes | grep -v '\ \ [0-9]\+' | awk '{print $1}' | grep '[0-9]\+')
#вытаскивает все ноды не прицепленные к енвам
fuel node set --node ${node_ids:0:1} --role controller --env $env_id
fuel node set --node ${node_ids:2:1} --role compute,cinder --env $env_id
fuel node set --node ${node_ids:4:1} --role nfs-service --env $env_id
#provision and deploy nodes
fuel --env $env_id deploy-changes