fuel plugins --install /tmp/nfs-service*
fuel env create --name cinder_nfs_ci --rel 2 --network-mode neutron --net-segment-type vlan
fuel node set --node 1 --role controller --env 1
fuel node set --node 2 --role compute,cinder --env 1
fuel node set --node 3 --role nfs-service --env 1