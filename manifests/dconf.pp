define gnome::dconf (
  $user   = 'root',
  $schema = undef,
  $key    = undef,
  $value  = undef,
) {
  exec {"set param ${keyname} under ${schema}/${key} with value ${value} for user ${user}":
    command => "/usr/bin/dconf write ${schema}/${key} \\\"'${value}'\\\" ",
    user    => $user,
    unless  => "/usr/bin/dconf read ${schema}/${key} | /usr/bin/grep -qF \"'${value}'\" ",
  }
}
