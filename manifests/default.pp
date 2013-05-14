node default {
  service { 'iptables':
    ensure => stopped,
    enable => false,
  }
}

node elasticsearch inherits default {
  package { 'java-1.7.0-openjdk':
    ensure => present
  } ->
  class { 'elasticsearch': cluster => 'graylog2' }
}

node mongodb inherits default {
  class { 'mongodb': }
}

node graylog2 inherits default {
  anchor { 'node_graylog2::begin': } ->
  package { 'java-1.7.0-openjdk':
    ensure => present
  } ->
  class { 'rvm':
    version => '1.9.3'
  } ->
  class   { 'graylog2::server':
    elasticsearch_host => '10.11.12.20',
    mongodb_host       => '10.11.12.21',
  } ->
  class { 'graylog2::web':
    ruby_version       => '1.9.3',
    elasticsearch_host => '10.11.12.20',
    mongodb_host       => '10.11.12.21',
  } ->
  anchor { 'node_graylog2::end': }
}

node client inherits default {
  package { 'httpd':
    ensure => present,
  } ->
  service { 'httpd':
    ensure => running,
  }

  package { 'java-1.7.0-openjdk':
    ensure => present
  }
}
