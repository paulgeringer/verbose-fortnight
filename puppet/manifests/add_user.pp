class linux_config::add_user(
  $username = undef
) {

  validate_string($username)

  user { $username:
    ensure      => present,
    gid         => $username,
    manage_home => true,
    shell       => '/bin/bash',
    require     => Group[$username],
  }

  group { $username: 
    ensure => present,
  }

  file { ["/home/${username}/",
          "/home/${username}/.ssh/"
    ensure => directory,
    owner  => $username,
    group  => $username,
  }

  file { "/home/${username}/.ssh/authorized_keys":
    ensure  => present,
    owner   => $username,
    group   => $username,
    content => 'puppet:///linux_config/pubkey',
  }

}
