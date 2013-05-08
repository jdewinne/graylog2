class mongodb {

  class { 'mongodb::install': } ->
  class { 'mongodb::service': } ->
  class { 'mongodb::config':  }

}

