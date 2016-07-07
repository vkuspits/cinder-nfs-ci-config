# Class: required-packages
#
#
class required-packages {
	# resources
	$required_packages = [ 'git', 'postgresql', 'postgresql-server-dev-all', 'libyaml-dev',
	    'libffi-dev', 'python-dev', 'python-libvirt', 'python-pip', 'qemu-kvm', 'qemu-utils',
	    'libvirt-bin', 'libvirt-dev', 'ubuntu-vm-builder', 'bridge-utils']
	$virt_env_packages = [ 'python-virtualenv', 'libpq-dev', 'libgmp-dev']
	package { $required_packages:
		ensure => present,
	}

	exec { 'apt-get update':
		command      => '/bin/apt-get update && /bin/apt-get upgrade -y',
		path         => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
		user         => 'root',
	}

	package { $virt_env_packages:
		ensure  => present,
		require => Exec['apt-get update'], 
	}

	class { 'python' :
  	  version    => 'system',
  	  pip        => 'present',
  	  dev        => 'absent',
  	  virtualenv => 'present',
  	  gunicorn   => 'absent',
	}

	module { 'stankevich/python':
 	    ensure => present,
	}

	python::virtualenv { 'fuel-devops-env':
	    ensure     => present,
	    systempkgs => true,
	    venv_dir   => '$WORKSPACE/cinder-nfs-ci-config/fuel-devops-env',
	    cwd        => '$WORKSPACE/cinder-nfs-ci-config/fuel-devops-env',
	    timeout    => 60,
	}

	python::pip { 'fuel-devops':
	    pkgname    => 'git+https://github.com/openstack/fuel-devops.git',
	    virtualenv => '$WORKSPACE/cinder-nfs-ci-config/fuel-devops-env',
	    timeout    => 60,    
    }
}