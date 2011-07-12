define php::conf($source = undef, $content = undef) {
    # Puppet will bail out if both source and content is set,
    # hence we don't have to deal with it.

    file { "${name}":
        path    => "${php::params::conf_dir}${name}.ini",
        mode    => 644,
        owner   => root,
        group   => root,
        ensure  => present,
        require => Class["php::config"],
        notify  => $php::params::notify,
        source  => $source,
        content => $content,
    }
}