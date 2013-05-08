# == Class: elasticsearch::config
#
# Submodule used by init.pp to configure the elasticsearch software.
#
class elasticsearch::config {

  file { "${elasticsearch::homedir}/elasticsearch/plugins":
    ensure => directory,
  }

  file { "${elasticsearch::homedir}/elasticsearch/config/elasticsearch.yml":
    ensure  => present,
    content => template('elasticsearch/elasticsearch.yml.erb'),
    notify  => Service[ "${elasticsearch::homedir}/elasticsearch/bin/elasticsearch" ],
  }

  file { "${elasticsearch::homedir}/elasticsearch/config/logging.yml":
    ensure  => present,
    content => template('elasticsearch/logging.yml.erb'),
    notify  => Service[ "${elasticsearch::homedir}/elasticsearch/bin/elasticsearch" ],
  }

  file { "${elasticsearch::homedir}/elasticsearch/bin/start.sh":
    ensure  => present,
    content => template('elasticsearch/start.sh.erb'),
    mode    => '0700',
  }

  file { "${elasticsearch::homedir}/elasticsearch/bin/stop.sh":
    ensure  => present,
    content => template('elasticsearch/stop.sh.erb'),
    mode    => '0700',
  }

  file { "${elasticsearch::homedir}/elasticsearch/bin/restart.sh":
    ensure  => present,
    content => template('elasticsearch/restart.sh.erb'),
    mode    => '0700',
  }

  file { "${elasticsearch::homedir}/elasticsearch/bin/status.sh":
    ensure  => present,
    content => template('elasticsearch/status.sh.erb'),
    mode    => '0700',
  }

  file { "${elasticsearch::homedir}/elasticsearch/bin/elasticsearch.in.sh":
    ensure  => present,
    content => template('elasticsearch/elasticsearch.in.sh.erb'),
    mode    => '0700',
    notify  => Service[ "${elasticsearch::homedir}/elasticsearch/bin/elasticsearch" ],
  }
}
