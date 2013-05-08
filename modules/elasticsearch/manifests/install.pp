class elasticsearch::install {

  group { $elasticsearch::params::group:
    ensure => present,
  }

  user { $elasticsearch::params::owner:
    ensure => present,
    gid    => $elasticsearch::params::group
  }

  extract { "${elasticsearch::homedir}/elasticsearch":
    archive => $elasticsearch::archive,
    creates => '/opt/elasticsearch/README.textile',
    owner   => $elasticsearch::params::owner,
    group   => $elasticsearch::params::group,
    require => User [ 'elasticsearch' ]
  }

}
