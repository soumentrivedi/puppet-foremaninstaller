class foremaninstaller($installType = 'AllInOne') {
   include foremaninstaller::setup
   case $installType {
   	'AllInOne': { include foremaninstaller::install_foreman }
   	'PuppetMaster': { include foremaninstaller::install_puppetmaster }
   	default: { include foremaninstaller::install_foreman }
   }      
  
}