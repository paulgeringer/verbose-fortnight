class linux_config::add_user(
) {


  user { $linux_config::username:
    ensure      => present,
    gid         => $linux_config::username,
    manage_home => true,
    shell       => '/bin/bash',
    require     => Group[$linux_config::username],
  }

  group { $linux_config::username: 
    ensure => present,
  }

  file { ["/home/${linux_config::username}/",
          "/home/${linux_config::username}/.ssh/"
    ensure => directory,
    owner  => $linux_config::username,
    group  => $linux_config::username,
  }

  file { "/home/${linux_config::username}/.ssh/authorized_keys":
    ensure  => present,
    owner   => $linux_config::username,
    group   => $linux_config::username,
    source  => 'puppet:///linux_config/pubkey',
  }

}
