class docker{
class { 'apt':
 always_apt_update => true,
}

apt::ppa { 'ppa:dotcloud/lxc-docker':}

# Your regular packages don't know or care about the PPA
package { [
    'build-essential',
    'vim',
    'curl',
    'zsh',
    'git-core',
    'htop',
    'wget',
    'linux-image-generic-lts-raring',
    'python-software-properties'
  ]:
  ensure  => 'installed',
}

# We single lxc-docker out to be able to specify
# the relationship to Apt::Ppa properly
package { 'lxc-docker':
  ensure => 'installed'
}

Apt::Ppa['ppa:dotcloud/lxc-docker'] ->
Package['lxc-docker']

}
