class bootstrap::misc {

  mailalias { 'local root phone home':
    ensure    => present,
    name      => 'root',
    recipient => '$root_email',
    notify    => Exec['/usr/bin/newaliases']
  }

  exec { '/usr/bin/newaliases':
    refreshonly => true
  }
}
