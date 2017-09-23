exec {"apt-get update":
  path => "/usr/bin",
}

package {"apache2":
  ensure => present,
  require => Exec["apt-get update"],
}

service { "apache2":
  ensure => "running",
  enable  => true,
  require => Package["apache2"]
}

package { ["mysql-server", "mysql-client"]:
  ensure => installed,
  require => Exec["apt-get update"]
}

service { "mysql":
  ensure  => running,
  require => Package["mysql-server"],
}

package {"memcached":
  ensure => present,
  require => Exec["apt-get update"],
}

service { "memcached":
  ensure => "running",
  require => Package["memcached"]
}

package {
	[
	"php5-common", "libapache2-mod-php5", "php5-cli", "php-apc", "php5-mysql", "php-gettext", 
	"php-http-request", "php-net-socket", "php-net-url", "php-pear", "php-soap", "php5-curl",
	"php5-gd", "php5-geoip", "php5-mcrypt", "php5-memcache", "php5-xdebug", "php5-xmlrpc", "php5-xsl",
	"phpmyadmin"
	]:
  ensure => installed,
  notify => Service["apache2"],
  require => [ Exec["apt-get update"], Package["mysql-client"], Package["apache2"] ],
}

exec { "/usr/sbin/a2enmod rewrite" :
  unless => "/bin/readlink -e /etc/apache2/mods-enabled/rewrite.load",
  notify => Service["apache2"],
  require => Package["apache2"]
}

file { "/etc/apache2/sites-enabled/testhost1":
  ensure => "link",
  target => "/vagrant/manifests/assets/testhost1.vhost.conf",
  require => Package["apache2"],
  notify => Service["apache2"],
  replace => yes,
  force => true
}

file { "/etc/apache2/sites-enabled/testhost2":
  ensure => "link",
  target => "/vagrant/manifests/assets/testhost2.vhost.conf",
  require => Package["apache2"],
  notify => Service["apache2"],
  replace => yes,
  force => true
}


