class linux_config::delete_user(
) {

  user { $linux_config::username: 
    ensure => absent,
  }

}
