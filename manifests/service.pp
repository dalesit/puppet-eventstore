# == Class eventstore::service
#
# This class is meant to be called from eventstore.
# It ensures the service is running.
#
class eventstore::service {
  service { $::eventstore::service_name:
    ensure      => running,
    enable      => true,
    hasstatus   => true,
    hasrestart  => true,
  }
}