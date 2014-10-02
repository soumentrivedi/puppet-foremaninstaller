class foremaninstaller::setup {
   yumrepo { 'base':
   	enabled => 0,
   } ->	
   yumrepo { "scl_ruby193":
      baseurl => "https://www.softwarecollections.org/repos/rhscl/ruby193/epel-6-x86_64/",
      descr => "Ruby 1.9.3 Dynamic Software Collection",
      enabled => 1,
      gpgcheck => 0,
   } ->
   yumrepo { "v8314_epel":
      baseurl => "https://www.softwarecollections.org/repos/rhscl/v8314/epel-6-x86_64/",
      descr => "v8314 epel-6-x86_64",
      enabled => 1,
      gpgcheck => 0,
   } ->
   yumrepo { "rhscl_v8314_epel":
      baseurl => "https://www.softwarecollections.org/repos/rhscl/v8314/rhscl-v8314-epel-6-x86_64/",
      descr => "rhscl-v8314-epel-6-x86_64",
      enabled => 1,
      gpgcheck => 0,
   } ->
   yumrepo { "oel_public":
      baseurl => "http://public-yum.oracle.com/repo/OracleLinux/OL6/5/base/x86_64/",
      descr => "OEL 6.5 x86_64 Public Yum Repo",
      enabled => 1,
      gpgcheck => 0,
   } ->
   package { 'epel-release':
   	  source => "https://anorien.csc.warwick.ac.uk/mirrors/epel/6/x86_64/epel-release-6-8.noarch.rpm",
   	  provider => rpm,
   } ->
   package { 'puppetlabs':
   	  source => "https://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm",
   	  provider => rpm,
   } ->
   package { 'foreman-release':
   	  source => "http://yum.theforeman.org/releases/1.6/el6/x86_64/foreman-release.rpm",
   	  provider => rpm,
   }
   package { 'foreman-installer':
   	  ensure => present,
   	  require => Package['foreman-release'],
   }   
}