# http://support.torch.sh/help/kb/graylog2-server/installing-graylog2-server-on-debian-6
class graylog2 {

  class { 'graylog2::install': } ->
  class { 'graylog2::config':  } ->
  class { 'graylog2::service': }

}
