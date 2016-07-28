# Сinder-nfs-ci-config
CI for cinder-nfs-plugin
# Requirements
This CI need Jenkins with slave-node
# Installation
On Jenkins master run command:

	git clone -o origin -b using_new_env https://github.com/vkuspits/cinder-nfs-ci-config.git

# Usage
On Jenkins master run command:

	jenkins-jobs --conf <conf.ini> update <dir_where_cinder-nfs-ci-config>/cinder-nfs-ci-config/jenkins_job_builder/

On Jenkins UI run job named cinder-nfs-plugin-build, another jobs triggered successively.