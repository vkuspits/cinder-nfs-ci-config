# Cinder-nfs-ci-config
CI for cinder-nfs-plugin
# Requirements
This CI need fuel-devops environment with 3 slave nodes and snapshot of fuel environment with 2 nodes controller, compute-cinder.
Installed open-jdk* in Fuel-master node.
In Jenkins config u need Fuel-master node configured as a jenkins-slave.
# Installation

	git clone -o origin -b using_snapshot https://github.com/vkuspits/cinder-nfs-ci-config.git

# Usage
Configure

    $FUEL-DEVOPS_DIR=<fuel-devops_dir>
	$SNAPSHOT_NAME=<name_of_env_snapshot>
	$ENV=<name_of_fuel-devops_env>

in cinder-nfs-ci-config/jenkins_job_builder/start-mos.yaml

on Jenkins Master

	jenkins-jobs --conf <conf.ini> update cinder-nfs-ci-config/jenkins_job_builder/

on Jenkins UI run job named cinder-nfs-plugin-build