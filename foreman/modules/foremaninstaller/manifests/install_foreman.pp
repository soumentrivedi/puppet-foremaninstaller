 class foremaninstaller::install_foreman {
   file { '/etc/foreman/foreman-installer-answers.yaml':
  	  ensure => present,
  	  source => 'puppet:///modules/foremaninstaller/foreman-installer-answers-allinone.yaml',
  	  require => Package['foreman-installer'],
   } 
   exec { 'foreman':
   	command => '/usr/sbin/foreman-installer --enable-foreman-proxy  --foreman-proxy-register-in-foreman=false',
   	require => Package['foreman-installer'],
	timeout => 0,
 	}
 }	
