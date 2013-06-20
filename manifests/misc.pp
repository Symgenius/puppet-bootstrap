class bootstrap::misc {

  if ! ${bootstrap::root_email} {
    fail("Module ${module_name} is missing \${bootstrap::root_email}. Please set!")
  }


  mailalias { 'local root phone home':
    ensure    => present,
    name      => 'root',
    recipient => '$bootstrap_misc_admin_email',
    notify    => Exec['/usr/bin/newaliases']
  }

  exec { '/usr/bin/newaliases':
    refreshonly => true
  }
}
