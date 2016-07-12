#Create openstack enviroment for cinder-nfs-plugin
fuel plugins --install /tmp/nfs-service*
fuel env create --name cinder_nfs_ci --rel 2 --network-mode neutron --net-segment-type vlan
#This part make plugin enabled in fuel env
fuel --env 1 settings --download
. /tmp/settings.py
fuel --env 1 settings --upload
#
#Set node roles
fuel node set --node 1 --role controller --env 1
fuel node set --node 2 --role compute,cinder --env 1
fuel node set --node 3 --role nfs-service --env 1
#provision and deploy nodes
fuel --env 1 deploy-changes