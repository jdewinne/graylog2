class mongodb::service {

  service { 'mongod':
    ensure  => running,
  }

}
