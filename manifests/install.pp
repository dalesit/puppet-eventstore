# Class eventstore::install
# Configures the repo and installs the package
class eventstore::install {

  $package_name = $eventstore::package_name
  $repo_source  = $eventstore::repo_source
  $repo_release = $eventstore::repo_release
  $repo_repo    = $eventstore::repo_repo   
  $repo_arch    = $eventstore::repo_arch   
  $key_source   = $eventstore::key_source  

  include apt
  apt::source { 'eventstore-oss':
    location      => $repo_source,
    release       => $repo_release,
    pin           => '700',
    include_src   => false,
    repos         => $repo_repo,
    architecture  => $repo_arch,
    key           => {
      'id'      => '418A7F2FB0E1E6E7EABF6FE8C2E73424D59097AB',
      'source'  => $key_source,
    }
  }
  package { $package_name:
    ensure  => 'installed'  
  }
}
