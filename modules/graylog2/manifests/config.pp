class graylog2::config {

  file { '/etc/graylog2.conf':
    ensure  => present,
    content => template('graylog2/graylog2.conf'),
  }

  file { '/etc/graylog2-elasticsearch.yml':
    ensure  => present,
    content => template('graylog2/graylog2-elasticsearch.yml'),
  }

}
