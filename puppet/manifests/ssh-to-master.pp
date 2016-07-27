package { 'open-ssh':
	ensure => installed,
}

ssh_authorized_key { '$master_connection':
  user   => 'root',
  type   => 'ssh-rsa',
  ensure => present,
}