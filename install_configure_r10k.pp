#
# Configure R10K 
# This manifest requires the zack/R10k module
#
class { 'r10k':
  version           => '1.4.0',
  sources           => {
    'puppet' => {
      'remote' => 'https://github.com/smbambling/puppetconf.git',
      'basedir' => "${::settings::confdir}/environments",
      'prefix'  => false,
    },
    'hiera'     => {
      'remote'  => 'https://github.com/smbambling/hiera.git',
      'basedir' => "${::settings::confdir}/hiera",
      'prefix'  => false,
    }
  },
  purgedirs         => ["${::settings::confdir}/environments"],
  manage_modulepath => false,
}
#
# Configure Dynamic Directory Environments 
# This manifest requires puppetlabs/inifile module and will attempt to configure puppet.conf
#
# Default for ini_setting resources:
Ini_setting {
    ensure => present,
      path => "${::settings::confdir}/puppet.conf",
}
ini_setting { 'Configure environmentpath':
    section   => 'main',
      setting => 'environmentpath',
        value => '$confdir/environments',
}
ini_setting { 'Configure basemodulepath':
    section   => 'main',
      setting => 'basemodulepath',
        value => '$confdir/modules',
}
