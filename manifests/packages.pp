# == Class: bootstrap
#
# Creates sane default environments for all our Systems.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if it
#   has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should not be used in preference to class parameters  as of
#   Puppet 2.6.)
#
# === Examples
#
#  class { bootstrap:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ]
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
class bootstrap::packages {

  package {
    [
    'bash-completion', # app-shells/bash-completion
    'bind-utils', # net-dns/bind-tools
    'dos2unix', # app-text/dos2unix
    'elinks', # www-client/elinks
    'git',
    'jwhois', # net-misc/jwhois
    'logrotate', # app-admin/logrotate
    'lrzsz', # net-dialup/lrzsz
    'lsof', # sys-process/lsof
    'lynx', # www-client/lynx
    'mc', # app-misc/mc
    'mtr', # net-analyzer/mtr
    'nano', # app-editors/nano
    'pwgen', # app-admin/pwgen
    'python-dateutil', # dev-python/python-dateutil
    'rsync', # net-misc/rsync
    'screen', # app-misc/screen
    'sharutils', # app-arch/sharutils
    'subversion', # dev-vcs/subversion
    'sysbench', # app-benchmarks/sysbench
    'sysstat', # app-admin/sysstat
    'telnet', # net-misc/telnet-bsd
    'unzip', # app-arch/unzip
    'vim-enhanced', # app-editors/vim
    'wget', # net-misc/wget
    'zip', # app-arch/zip
    ]:
    ensure => installed,
  }

  case $::osfamily {
    'RedHat': {
      include bootstrap::packages::redhat
    }
    'Debian': {
      include bootstrap::packages::debian
    }
    default: {
      fail("Module ${module_name} is not supported on ${::osfamily}")
    }
  }

}
