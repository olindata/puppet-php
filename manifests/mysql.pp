class php::mysql {

  package { 'php5-mysql':
    ensure => present
  }

  file {'/etc/php5/conf.d/mysqli.ini':
    ensure  => present,
    source  => 'puppet:///files/php/mysqli.ini'
  }

  file {'/etc/php5/conf.d/mysql.ini':
    ensure  => present,
    source  => 'puppet:///files/php/mysqli.ini'
  }

  file {'/etc/php5/conf.d/pdo_mysql.ini':
    ensure  => present,
    source  => 'puppet:///files/php/pdo_mysql.ini'
  }

}
