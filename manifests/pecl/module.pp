define php::pecl::module (
  $preferred_state = 'stable',
  $auto_answer = '\\n',
  $ensure = present,
  $path = '/usr/bin:/usr/sbin:/bin:/sbin',
  $verbose = false,
  $version = '',
  $config_file = "/etc/php5/conf.d/${name}.ini") {

  include php::pear
  include php::dev

  if $version != '' {
    $new_version = "-${version}"
  } else {
    $new_version = ''
  }

  $pecl_exec_command = $ensure ? {
    present => "printf \"${auto_answer}\" | pecl -d preferred_state=${preferred_state} install ${name}${new_version}",
    absent  => "pecl uninstall -n ${name}",
  }

  $pecl_exec_unless = $ensure ? {
    present => "pecl info ${name}",
    absent  => undef
  }

  $pecl_exec_onlyif = $ensure ? {
    present => undef,
    absent  => "pecl info ${name}",
  }
  
  exec { "pecl-${name}":
    command   => $pecl_exec_command,
    unless    => $pecl_exec_unless,
    onlyif    => $pecl_exec_onlyif,
    path      => $path,
    require   => [ Class['php::pear'], Class['php::dev']],
  }

  file { $config_file:
    ensure  => $ensure,
    content => "extension=${name}.so",
    require => Exec["pecl-${name}"],
  }

}
