node 'localhost.ordsvy.gov.uk' {
	include foremaninstaller
}

node 'workstation1.ordsvy.gov.uk' {
	class { 'foremaninstaller':
		installType => 'PuppetMaster',
	}
}
#include foreman
#include puppet
#include puppet::server