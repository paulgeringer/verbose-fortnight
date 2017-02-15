class linux_config::delete_user(
  $username = undef
) {

  validate_string($username)

  user { $username: 
    ensure => absent,
  }

}
