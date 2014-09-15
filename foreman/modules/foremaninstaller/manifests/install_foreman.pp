 class foremaninstaller::install_foreman {
   file { '/etc/foreman/foreman-installer-answers.yaml':
  	  ensure => present,
  	  source => 'puppet:///modules/foremaninstaller/foreman-installer-answers-allinone.yaml',
   } 
   exec { 'foreman':
   	command => '/usr/sbin/foreman-installer',
   	require => Package['foreman-installer'],
 	}
 }	