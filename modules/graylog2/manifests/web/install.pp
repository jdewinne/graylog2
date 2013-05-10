class graylog2::web::install {

  group { 'graylog2-web':
    ensure => present,
  }

  user { 'graylog2-web':
    ensure => present,
    gid    => 'graylog2-web',
    home   => '/opt/graylog2-web-interface',
  }

  extract { '/opt/graylog2-web-interface':
    ensure  => present,
    archive => 'http://download.graylog2.org/graylog2-web-interface/graylog2-web-interface-0.11.0.tar.gz',
    creates => '/opt/graylog2-web-interface/README',
    owner   => 'graylog2-web',
    group   => 'graylog2-web',
    require => User [ 'graylog2-web' ]
  }

  package { ['libcurl-devel', 'pcre-devel']:
    ensure => present,
  }

  package { 'passenger':
    ensure   => present,
    provider => 'gem',
    require  => Package['libcurl-devel', 'pcre-devel'],
  }

  exec { 'bundle install':
    cwd       => '/opt/graylog2-web-interface',
    command   => "/usr/local/rvm/bin/rvm ${graylog2::web::ruby_version}@global do bundle install &&
                  touch /opt/graylog2-web-interface/bundle.install",
    unless    => 'test -f /opt/graylog2-web-interface/bundle.install',
    path      => [ '/bin', '/usr/bin' ],
    logoutput => on_failure,
    require   => Extract [ '/opt/graylog2-web-interface' ],
  }

}
