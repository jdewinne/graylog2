node default {
  service { 'iptables':
    ensure => stopped,
    enable => false,
  }

  notice("Please be patient, this Puppet run can take up to 15 minutes to complete...")
  package { 'java-1.7.0-openjdk': ensure => present } ->
  class   { 'mongodb': }                              ->
  class   { 'elasticsearch': cluster => 'graylog2' }  ->
  class   { 'rvm': version => '1.9.3' }               ->
  class   { 'graylog2::server': }                     ->
  class   { 'graylog2::web': ruby_version => '1.9.3' }
}

