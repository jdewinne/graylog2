# http://support.torch.sh/help/kb/graylog2-server/installing-graylog2-server-on-debian-6
class graylog2::server {

  class { 'graylog2::server::install': } ->
  class { 'graylog2::server::config':  } ->
  class { 'graylog2::server::service': }

}
