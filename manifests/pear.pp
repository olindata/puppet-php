class php::pear inherits php {

  $package_pear = $::operatingsystem ? {
    /(?i:Ubuntu|Debian|Mint)/ => 'php-pear',
    /(?i:SLES|OpenSuSe)/ => 'php5-pear',
    default => 'php-pear',
  }


  package { 'php-pear':
    name    => $package,
    ensure  => present,
  }

}
