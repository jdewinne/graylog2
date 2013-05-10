class graylog2::server::config {

  file { '/etc/graylog2.conf':
    ensure  => present,
    content => template('graylog2/server/graylog2.conf'),
  }

  file { '/etc/graylog2-elasticsearch.yml':
    ensure  => present,
    content => template('graylog2/server/graylog2-elasticsearch.yml'),
  }

}
