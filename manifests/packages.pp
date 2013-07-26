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
    'vnstat',
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
