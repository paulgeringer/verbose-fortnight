class linux_config( 
  $username = undef 
) {

  validate_string($username)

  include linux_config::add_user

  include linux_config::delete_user

  include linux_config::list_users

}
