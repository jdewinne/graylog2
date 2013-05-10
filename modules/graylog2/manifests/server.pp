# http://support.torch.sh/help/kb/graylog2-server/installing-graylog2-server-on-debian-6
class graylog2::server (
  $elasticsearch_host = '127.0.0.1',
  $mongodb_user       = 'grayloguser',
  $mongodb_password   = 'graylogpass',
  $mongodb_host       = '127.0.0.1',
  $mongodb_database   = 'graylog2',
  $mongodb_port       = '27017'
){

  anchor { 'graylog2::server::begin': }
  class { 'graylog2::server::install': } ->
  class { 'graylog2::server::config':  } ->
  class { 'graylog2::server::service': }
  anchor { 'graylog2::server::end': }

}
