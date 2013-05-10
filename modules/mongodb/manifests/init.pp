class mongodb {

  anchor { 'mongodb::begin': }
  class  { 'mongodb::install': } ->
  class  { 'mongodb::service': } ->
  class  { 'mongodb::config':  }
  anchor { 'mongodb::end': }

}

