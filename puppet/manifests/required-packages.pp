# Class: required-packages
#
#
class required-packages {
	# resources
	$required_packages = [ 'git', 'postgresql', 'postgresql-server-dev-all',
	  'libyaml-dev', 'libffi-dev', 'qemu-kvm', 'qemu-utils',
	  'libvirt-bin', 'libvirt-dev', 'ubuntu-vm-builder', 'bridge-utils']
	
	package { $required_packages:
	  	ensure => present,
	}

	exec { 'module' :
      	command => 'puppet module install stankevich/python',
      	path    => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
	}


	# Class: python
	#
	#
	class { 'python' :
		version    => 'system',
  		pip        => 'present',
  		dev        => 'absent',
  		virtualenv => 'present',
  		gunicorn   => 'absent',
	}
	#Change directory for fuel-devops-env, remake job in jenkins
	#to do ssh connection to slave node, before run puppet script
	#with requiring pkgs, and creating fuel env 
	python::virtualenv { 'fuel-devops-env':
	    ensure     => present,
	    systempkgs => true,
	    venv_dir   => '$WORKSPACE/fuel-devops-env',
	    cwd        => '$WORKSPACE/fuel-devops-env',
	    timeout    => 60,
	}

	python::pip { 'fuel-devops':
	    pkgname    => 'git+https://github.com/openstack/fuel-devops.git',
	    virtualenv => '$WORKSPACE/fuel-devops-env',
	    timeout    => 60,    
    }
}