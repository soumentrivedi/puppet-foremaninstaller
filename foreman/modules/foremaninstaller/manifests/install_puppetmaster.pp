 class foremaninstaller::install_puppetmaster {
 	require foremaninstaller::setup
   exec { 'puppetmaster':   	
   	require => Package['foreman-installer'],
   	command => '/usr/sbin/foreman-installer --no-enable-foreman --no-enable-foreman-plugin-bootdisk --no-enable-foreman-plugin-setup --enable-puppet --puppet-server-ca=false --puppet-server-foreman-url=https://foremanserver:4443 --enable-foreman-proxy --foreman-proxy-puppetca=false --foreman-proxy-tftp=false --foreman-proxy-foreman-base-url=https://foremanserver:8443 --foreman-proxy-oauth-consumer-key=UJq9m2NF2nXy5fErcxXXvzbTVV9e7vr8 --foreman-proxy-oauth-consumer-secret=bUxVpZLpuqKLWPL8d5S3MfdNSEEWuaF5',
 	}
 }	