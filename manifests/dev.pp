class php::dev {

  $package_devel = $::operatingsystem ? {
    /(?i:Ubuntu|Debian|Mint)/ => 'php5-dev',
    /(?i:SLES|OpenSuSe)/ => 'php5-devel',
    default => 'php-devel',
  }

  package { 'php-devel':
    ensure  => present,
    name    => $package_devel,
  }

}
