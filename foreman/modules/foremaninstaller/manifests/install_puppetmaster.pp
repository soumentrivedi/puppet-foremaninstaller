 class foremaninstaller::install_puppetmaster {
   exec { 'puppetmaster':   	
   	require => Package['foreman-installer'],
   	command => '/usr/sbin/foreman-installer \
  --no-enable-foreman \
  --no-enable-foreman-plugin-bootdisk \
  --no-enable-foreman-plugin-setup \
  --enable-puppet \
  --puppet-server-ca=false \
  --puppet-server-foreman-url=https://10.160.32.67:4443 \
  --enable-foreman-proxy \
  --foreman-proxy-puppetca=false \
  --foreman-proxy-tftp=false \
  --foreman-proxy-foreman-base-url=https://10.160.32.67:4443 \
  --foreman-proxy-oauth-consumer-key=PTXDjQZ3duPDBjhEsezYEjLELaesWsYo \
  --foreman-proxy-oauth-consumer-secret=oodax4bG37LCZGw259gzvG3sVkSq3Vez',
 	}
 }	