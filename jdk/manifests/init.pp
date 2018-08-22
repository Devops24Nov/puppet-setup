class jdk {

class { 'apt':
always_apt_update => true,
}

apt::ppa { 'ppa:webupd8team/java':}

package { 'oracle-java8-installer':
ensure  => 'installed',
require => Apt::Ppa['ppa:webupd8team/java']
}

}
