node default {
  service { 'iptables':
    ensure => stopped,
    enable => false,
  }

  package { 'java-1.7.0-openjdk': ensure => present } ->
  class   { 'mongodb': }                              ->
  class   { 'elasticsearch': cluster => 'graylog2' }  ->
  class   { 'graylog2': }
}

