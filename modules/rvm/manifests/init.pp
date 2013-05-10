class rvm (
  $version = '1.9.3'
) {

  exec { 'install-rvm':
    cwd       => '/tmp',
    command   => "curl -L https://get.rvm.io | bash -s stable --rails --autolibs=enabled  --ruby=${version}",
    path      => ['/bin', '/usr/bin'],
    unless    => 'test -d /usr/local/rvm',
    timeout   => 0,
    logoutput => on_failure,
  }

}
