class stig_generic (
  $ipv6enabled = false,
  $automount   = false,
  $tftpserver  = false,
  $qpidd       = false,
  $x11         = false,
){

  if ($::operatingsystem == 'RedHat') { 
  #RHEL-06-000009 - Only RedHat OS since variants don't use satellite.
    service { 'rhnsd':
      ensure => 'stopped',
      enable => false,
    }
  }

  #RHEL-06-000071
  package { 'screen':
    ensure => 'installed',
  }
  if ($ipv6enabled) {
  #RHEL-06-000103, RHEL-06-000106, RHEL-06-000107
    service { 'ip6tables':
      ensure => 'running',
      enable => true,
    }
  }
  if ($tftpserver == false ) {
  #RHEL-06-000204, RHEL-05-000203
    package { 'xinetd':
      ensure => 'absent',
    }
  }
  #RHEL-06-000206, RHEL-06-000211
  package { 'telnet-server':
    ensure => 'absent',
  }
  #RHEL-06-000213, RHEL-06-000214
  package { 'rsh-server':
    ensure => 'absent',
  }
  #RHEL-06-000216
  service { 'rexec':
    ensure => 'stopped',
    enable => false,
  }
  #RHEL-06-000218
  service { 'rlogin':
    ensure => 'stopped',
    enable => false,
  }
  #RHEL-06-000220
  package { 'ypserv':
    ensure => 'absent',
  }
  #RHEL-06-000221
  service { 'ypbind':
    ensure => 'stopped',
    enable => false,
  }
  if ($tftpserver == false ) { 
    #RHEL-06-000222, RHEL-06-000223
    package { 'tftp-server':
      ensure => 'absent',
    }
  }
  #RHEL-06-000246
  service { 'avahi-daemon':
    ensure => 'stopped',
    enable => false,
  }
  #RHEL-06-000256
  package { 'openldap-servers':
    ensure => 'absent',
  }
  #RHEL-06-000261
  service { 'abrtd':
    ensure => 'stopped',
    enable => false,
  }
  #RHEL-06-000262
  service { 'atd':
    ensure => 'stopped',
    enable => false,
  }
  #RHEL-06-000265
  service { 'ntpdate':
    ensure => 'stopped',
    enable => false,
  }
  if ($qpidd == false ) {
  #RHEL-06-000267
    service { 'qpidd':
      ensure => 'stopped',
      enable => false,
    }
  }
  #RHEL-06-000268
  service { 'rdisc':
    ensure => 'stopped',
    enable => false,
  }
  #RHEL-06-000288
  package { 'sendmail':
    ensure => 'absent',
  }
  #RHEL-06-000289
  service { 'netconsole':
    ensure => 'stopped',
    enable => false,
  }
  #RHEL-06-000291
  if ($x11 == false ) {
    package { 'xorg-x11-server-common':
      ensure => 'absent',
    }
  }
  #RHEL-06-000331
  service { 'bluetooth':
    ensure => 'stopped',
    enable => false,
  }

  if ( $automount == false) 
  {
    #RHEL-06-000526
    service { 'autofs':
      ensure => 'stopped',
      enable => false,
    }
    service { 'netfs':
      ensure => 'stopped',
      enable => false,
    }
    service { 'nfslock':
      ensure => 'stopped',
      enable => false,
    }
    service { 'rpcgssd': 
      ensure => 'stopped',
      enable => false,
    }
    service {'rpcidmapd':
      ensure => 'stopped',
      enable => false,
    }
  }
  #CCE-26850-8
  service { 'kdump':
    ensure => 'stopped',
    enable => false,
  }
  #2.4.3
  package { 'setroubleshoot':
    ensure => 'absent',
  }
  package { 'mctrans':
    ensure => 'absent',
  }
  #3.17/3.12
  package { 'dovecot':
    ensure => 'absent',
  }

  
}
