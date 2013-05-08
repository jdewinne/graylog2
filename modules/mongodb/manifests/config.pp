class mongodb::config {

  file { 'mongo.js':
    ensure  => present,
    path    => '/etc/mongo.js',
    content => template('mongodb/mongo.js'),
    notify  => Exec [ 'apply-config' ],
  }

  exec { 'apply-config':
    command     => '/usr/bin/mongo < /etc/mongo.js',
    refreshonly => true,
    logoutput   => on_failure,
  }

}
