# == Class eventstore::params
#
# This class is meant to be called from eventstore.
# It sets variables according to platform.
#
class eventstore::params {
  $manage_repo      = true
  $manage_package   = true
  $eventstore_conf  = '/etc/eventstore/eventstore.conf'
  $eventstore_user  = 'eventstore'
  $eventstore_group = 'eventstore'
  $repo_source      = 'https://packagecloud.io/EventStore/EventStore-OSS/ubuntu/'
  $repo_release     = 'trusty'
  $repo_repo        = 'main'
  $repo_arch        = 'amd64'
  $key_source       = 'https://packagecloud.io/EventStore/EventStore-OSS/gpgkey'
  $default_settings   = {
    'log'                 => '/var/log/eventstore',
    'int-ip'              => $facts['ipaddress'],
    'ext-ip'              => $facts['ipaddress'],
    'int-tcp-port'        => 1111,
    'ext-tcp-port'        => 1112,
    'int-http-port'       => 2113,
    'ext-http-port'       => 2114,
    'cluster-size'        => 3,
    'cluster-dns'         => 'cluster.example.com',
    'cluster-gossip-port' => 2113,
  }

  case $::osfamily {
    'Debian': {
      $package_name = 'eventstore-oss'
      $service_name = 'eventstore'
      $platform_specific_settings = {}
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
  $settings = merge($default_settings,$platform_specific_settings)
}
