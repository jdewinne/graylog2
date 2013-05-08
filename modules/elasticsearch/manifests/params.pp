class elasticsearch::params {
  $ensure    = present
  $master    = true
  $data      = true
  $homedir   = '/opt'
  $datadir   = undef
  $workdir   = undef
  $archive   = 'https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-0.20.4.tar.gz'
  $owner     = 'elasticsearch'
  $group     = 'elasticsearch'
  $cluster   = 'elasticsearch'
  $shards    = 5
  $replicas  = 1
  $loglevel  = 'INFO'
  $heapsize  = '1g'
}
