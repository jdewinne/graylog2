use admin
 db.addUser('admin', 'adminpass')
 db.auth('admin', 'adminpass')
use graylog2
 db.addUser('grayloguser', 'graylogpass')
 db.auth('grayloguser', 'graylogpass')
