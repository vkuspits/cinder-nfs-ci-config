package { 'open-ssh':
	ensure => installed,
}

ssh_authorized_key { 'root@10.10.0.2':
  user   => 'root',
  type   => 'ssh-rsa',
  ensure => present,
}