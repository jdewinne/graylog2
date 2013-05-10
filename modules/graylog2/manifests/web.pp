# http://support.torch.sh/help/kb/graylog2-web-interface/installing-graylog2-web-interface-on-debian-6
class graylog2::web (
  $ruby_version       = '1.9.3',
  $elasticsearch_host = '127.0.0.1',
  $mongodb_user       = 'grayloguser',
  $mongodb_password   = 'graylogpass',
  $mongodb_host       = '127.0.0.1',
  $mongodb_database   = 'graylog2',
  $mongodb_port       = '27017'
) {

  anchor { 'graylog2::web::begin': }
  class { 'graylog2::web::install': } ->
  class { 'graylog2::web::config':  }
  # class { 'graylog2::web::service': }
  anchor { 'graylog2::web::end': }

}
