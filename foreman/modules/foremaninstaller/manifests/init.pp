class foremaninstaller {
   include foremaninstaller::setup
   include foremaninstaller::install_foreman
   include foremaninstaller::setup_r10k
}