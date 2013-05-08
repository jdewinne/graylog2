# == Class: elasticsearch::service
#
# Submodule used by init.pp to define and stop/start the
# elasticsearch daemon(s) and/or proces(ses)
#
class elasticsearch::service {

  service { "${elasticsearch::homedir}/elasticsearch/bin/elasticsearch":
    ensure     => $elasticsearch::ensure_service,
    hasstatus  => false,
    hasrestart => false,
    start      => "${elasticsearch::homedir}/elasticsearch/bin/start.sh",
    stop       => "${elasticsearch::homedir}/elasticsearch/bin/stop.sh",
    restart    => "${elasticsearch::homedir}/elasticsearch/bin/restart.sh",
    status     => "${elasticsearch::homedir}/elasticsearch/bin/status.sh | grep running > /dev/null 2>&1",
  }

}
