# Cinder-nfs-ci-config
CI for cinder-nfs-plugin
# Requirements
This CI need fuel-devops environment with 3 slave nodes and snapshot of fuel environment with 2 nodes controller, compute-cinder.
# Installation

	git clone -o origin -b using_snapshot https://github.com/vkuspits/cinder-nfs-ci-config.git

# Usage
Run 
on Jenkins Slave

	export $FUEL-DEVOPS_DIR=<fuel-devops_dir>
	export $SNAPSHOT_NAME=<name_of_env_snapshot>
	export $ENV=<name_of_fuel-devops_env>
	export $FACTER_master_connection=<root@ip_of_masternode>

on Jenkins Master

	jenkins-jobs --conf <conf.ini> update cinder-nfs-ci-config/jenkins_job_builder/

on Jenkins UI run job named cinder-nfs-plugin-build