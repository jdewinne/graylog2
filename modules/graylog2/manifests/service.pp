class graylog2::service {

  service { 'graylog2':
    ensure  => running,
    start   => '/opt/graylog2-server/bin/graylog2ctl start',
    stop    => '/opt/graylog2-server/bin/graylog2ctl stop',
    status  => '/opt/graylog2-server/bin/graylog2ctl status | grep -v not',
    restart => '/opt/graylog2-server/bin/graylog2ctl restart',
  }

}
