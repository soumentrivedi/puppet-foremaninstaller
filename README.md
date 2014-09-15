puppet-foremaninstaller
=======================

Install foreman and other components using Puppet &amp; vagrant


Pre-requisites
========
vagrant plugin install vagrant-hosts

vagrant plugin install vagrant-proxyconf

Software version
========
Puppet v3.4.x or above

Ruby v1.8.7 or above

Vagrant v1.6.5 (please note: Vagrant v1.6.4 has a bug with host provisioning)



How to run
========
vagrant up

Output expected:
================
Workstation2: Foreman, Puppet CA, Puppet DB, Puppet Master, TFTP, VMWare provider support

Workstation1: Puppet Master
