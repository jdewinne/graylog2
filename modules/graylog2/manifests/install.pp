class graylog2::install {

  group { 'graylog2':
    ensure => present,
  }

  user { 'graylog2':
    ensure => present,
    gid    => 'graylog2'
  }

  extract { "/opt/graylog2-server":
    ensure  => present,
    archive => 'http://download.graylog2.org/graylog2-server/graylog2-server-0.11.0.tar.gz',
    creates => '/opt/graylog2-server/README.markdown',
    owner   => 'graylog2',
    group   => 'graylog2',
    require => User [ 'graylog2' ]
  }

}
