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
  },
  purgedirs         => ["${::settings::confdir}/environments"],
  manage_modulepath => false,
}
