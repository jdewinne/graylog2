class graylog2::web::config {

  file { '/opt/graylog2-web-interface/config/indexer.yml':
    ensure  => present,
    content => template('graylog2/web/indexer.yml.erb'),
    owner   => 'graylog2-web',
    group   => 'graylog2-web',
  }

  file { '/opt/graylog2-web-interface/config/mongoid.yml':
    ensure  => present,
    content => template('graylog2/web/mongoid.yml.erb'),
    owner   => 'graylog2-web',
    group   => 'graylog2-web',
  }

}
