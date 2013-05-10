# http://support.torch.sh/help/kb/graylog2-web-interface/installing-graylog2-web-interface-on-debian-6
class graylog2::web (
  $ruby_version = '1.9.3'
) {

  class { 'graylog2::web::install': } ->
  class { 'graylog2::web::config':  }
  # class { 'graylog2::web::service': }

}
