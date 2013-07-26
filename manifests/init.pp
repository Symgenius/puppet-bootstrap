# == Class: bootstrap
#
# Creates sane default environments for all our Systems.
#
# === Parameters
#
# Document parameters here.
#
# [*root_email*]
#   Where to send root emails to? ex cron outputs
#   Defaults to root@localhost
#
# === Variables
#
# === Examples
#
#  class { bootstrap:
#    root_email => 'you@yourhost.com'
#  }
#
# === Authors
#
# Alexander Bien <abien@gmx.net>
#
# === Copyright
#
# Copyright 2013 Alexander Bien
#
class bootstrap ($root_email='root@localhost') {

  include bootstrap::packages
  include bootstrap::misc

}
