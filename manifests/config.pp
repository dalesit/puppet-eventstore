# == Class eventstore::config
#
# This class is called from eventstore for service configuration.
# see https://github.com/EventStore/docs.geteventstore.com/blob/gh-pages/server/3.3.0/command-line-arguments.md
# for descriptions of these settings
#
class eventstore::config {
  $merged_settings = merge($::eventstore::params::settings,$::eventstore::settings)
  file { $::eventstore::params::eventstore_conf:
    owner   => $::eventstore::params::eventstore_user,
    group   => $::eventstore::params::eventstore_group,
    mode    => '0644',
    content => template('eventstore/eventstore.conf.erb'),
    notify  => Service[$::eventstore::service_name],
    before  => Service[$::eventstore::service_name],
  }
}