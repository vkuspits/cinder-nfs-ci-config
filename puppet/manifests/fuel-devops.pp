# Class: fuel-devops
#
#
class fuel-devops {
	# resources
	$iso_path = '$WORKSPACE/'
    $create_command = '$WORKSPACE/cinder-nfs-ci-config/fuel-devops-env/bin/dos.py 
    create --vcpu 2 --node-count 4 --ram 3 --iso-path $iso_path --admin-ram 4 
    --admin-disk-size 80 cinder_nfs_ci'
    $cleanup_command = '$WORKSPACE/cinder-nfs-ci-config/fuel-devops-env/bin/dos.py 
    erase cinder_nfs_ci'
    $template_path = '$WORKSPACE/cinder-nfs-ci-config/fuel-devops-env/devops/
    temlates/default.yaml'

    module { 'puppetlabs/stdlib':
          ensure => present,
    }

    file_line {'net-conf':
    	line   => '- &pool_default !os_env POOL_DEFAULT, 10.10.0.0/16:24',
    	path   => '$template_path',
    	ensure => 'present',
    	match  => '-\ &pool_default\ !os_env\ POOL_DEFAULT,',
    	before => Exec['env-create'],
    }

    exec { 'env-cleanup':
    	command => '/usr/bin/python $cleanup_command',
		path    => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
		cwd     => '$WORKSPACE/cinder-nfs-ci-config/fuel-devops-env/bin/',
    }

	exec { 'env-create':
		command => '/usr/bin/python $create_command',
		path    => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
		cwd     => '$WORKSPACE/cinder-nfs-ci-config/fuel-devops-env/bin/',
		require => Exec['env-cleanup'],
	}
}