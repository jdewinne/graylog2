# == Class: elasticsearch
#
# This module will install an elasticsearch node on a host.
# Tested on CentOS 6.3 and Ubuntu 12.04LTS.
#
# Use the Cluster Health API [http://localhost:9200/_cluster/health], the
# Node Info API [http://localhost:9200/_cluster/nodes] or GUI tools
# such as <http://github.com/lukas-vlcek/bigdesk> and
# <http://mobz.github.com/elasticsearch-head> to inspect the cluster state
# when done installing.
#
# === Parameters
#
# [*ensure*]
#   Indicates wheter elasticsearch should be installed ('present', same as 'stopped'),
#   uninstalled ('absent') or installed and running ('running').
#
# [*master*]
#   Indicates wheter this elasticsearch instance can act as a master
#
# [*data*]
#   Indicates wheter this elasticsearch instance can store index data
#
# You can exploit the master and data settings to design advanced cluster topologies.
#
# 1. You want this node to never become a master node, only to hold data.
#    This will be the "workhorse" of your cluster.
#
#   master: false
#   data: true
#
# 2. You want this node to only serve as a master: to not store any data and
#    to have free resources. This will be the "coordinator" of your cluster.
#
#   master: true
#   data: false
#
# 3. You want this node to be neither master nor data node, but
#    to act as a "search load balancer" (fetching data from nodes,
#    aggregating results, etc.)
#
#   master: false
#   data: false
#
# [*homedir*]
#   The parent directory where the elasticsearch directory should be created.
#   Defaults to: /opt
#
# [*version*]
#   Optional: Version of elasticsearch to be installed. Default: 0.20.5.
#
# [*cluster*]
#   Optional: Name of the elasticsearch cluster. When multiple clusters are on the same network,
#   this name should be unique. Defaults to: elasticsearch.
#
# [*shards*]
#   Optional: Sets the number of shards (splits) for an index. Default: 5
#
# [*replicas*]
#   Optional: Sets the number of replicas of an index. Default: 1
#
# The shards and replicas settings directly affect the performance of index and search operations
# in your cluster. Assuming you have enough machines to hold shards and
# replicas, the rule of thumb is:
#
# 1. Having more *shards* enhances the _indexing_ performance and allows to
#    _distribute_ a big index across machines.
# 2. Having more *replicas* enhances the _search_ performance and improves the
#    cluster _availability_.
#
# The shards is a one-time setting for an index.
# Use the Index Status API (<http://localhost:9200/A/_status>) to inspect
# the index status.
#
# [*datadir*]
#   Optional: Directory where the index data will be stored. Defaults to
#   ${homedir}/elasticsearch/data. Can optionally include more than one location,
#   causing data to be striped across the locations (similar to RAID 0) on a file
#   level, favouring locations with most free space on creation. For example:
#   `/path/to/data1,/path/to/data2`
#
# [*workdir*]
#   Optional: Directory where the temporary files will be stored.
#
# === Examples
#
#  class { elasticsearch:
#    ensure  => present,
#    master  => true,
#    data    => false,
#    cluster => 'DOP_ES',
#  }
#
class elasticsearch (
  $ensure    = $elasticsearch::params::ensure,
  $master    = $elasticsearch::params::master,
  $data      = $elasticsearch::params::data,
  $homedir   = $elasticsearch::params::homedir,
  $archive   = $elasticsearch::params::archive,
  $cluster   = $elasticsearch::params::cluster,
  $shards    = $elasticsearch::params::shards,
  $replicas  = $elasticsearch::params::replicas,
  $datadir   = $elasticsearch::params::datadir,
  $workdir   = $elasticsearch::params::workdir,
  $heapsize  = $elasticsearch::params::heapsize

) inherits elasticsearch::params {

  File {
    owner => $elasticsearch::params::owner,
    group => $elasticsearch::params::group,
  }

  $ensure_service = $ensure ? {
    'stopped' => stopped,
    default   => running,
  }

  case $ensure {
    'present', 'stopped', 'running' : {
      anchor { 'elasticsearch::begin': }
      class  { 'elasticsearch::install': } ->
      class  { 'elasticsearch::config': } ->
      class  { 'elasticsearch::service': }
      anchor { 'elasticsearch::end': }
    }
    default : {
      fail('Invalid value for ensure. Only present, stopped or running is allowed.')
    }
  }
}
