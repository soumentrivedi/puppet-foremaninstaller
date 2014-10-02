class foremaninstaller::setup_r10k { 
	package { 'r10k':
	    ensure   => 'installed',
	    provider => 'gem',
	}
   file { '/etc/r10k.yaml':
  	  ensure => present,
  	  source => 'puppet:///modules/foremaninstaller/r10k.yaml',  	  
   } 	
   exec { 'r10k-deploy':
	  command => '/usr/bin/r10k deploy environment',
	  require => [ Package['r10k'], File['/etc/r10k.yaml'], Exec['foreman'] ],
	  timeout => 0,
	}		
}