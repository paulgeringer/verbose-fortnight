class linux_config::list_user() {

  exec { 'list_users':
    command => 'awk -F : \'{print "username: " $1, "user_id: " $3, "comment: " $5}\' /etc/passwd | grep -v \#'
  }

}
