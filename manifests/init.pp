# Class: eventstore
# ===========================
#
# Full description of class eventstore here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'eventstore':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name Joel Smith <
#
# Copyright
# ---------
#
# Copyright 2015 Joel Smith
#
class eventstore (
  String[1] $package_name = $::eventstore::params::package_name,
  String[1] $service_name = $::eventstore::params::service_name,
  Boolean $manage_package = $::eventstore::params::manage_package,
  Boolean $manage_repo    = $::eventstore::params::manage_repo,
  String[1] $repo_source  = $::eventstore::params::repo_source,
  String[1] $repo_release = $::eventstore::params::repo_release,
  String[1] $repo_repo    = $::eventstore::params::repo_repo,
  String[1] $repo_arch    = $::eventstore::params::repo_arch,
  String[1] $key_source   = $::eventstore::params::key_source,
  Hash[String, Variant[String, Boolean, Integer]] $settings = {},
) inherits ::eventstore::params {
  if $manage_package {
    include ::eventstore::install
    }

  class { 'eventstore::config': } ~>
  
  class { 'eventstore::service': }
}
