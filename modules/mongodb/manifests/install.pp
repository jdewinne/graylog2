class mongodb::install {

  yumrepo { '10gen':
    descr    => '10gen Repository',
    baseurl  => 'http://downloads-distro.mongodb.org/repo/redhat/os/x86_64',
    gpgcheck => 0,
    enabled  => 1,
  }

  package { [ 'mongo-10gen', 'mongo-10gen-server' ]:
    ensure  => present,
    require => Yumrepo [ '10gen' ],
  }

}
