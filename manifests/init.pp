class java (
  $java_version      = $java::params::java_version,
  $java_package_type = $java::params::java_package_type,
) inherits java::params {
  if ( $::osfamily == 'RedHat' and $::operatingsystemmajrelease == 5 ) { 

    if ( $java_package_type == 'sun' and $version == '6' ) {
      package { $sunjava6_package:
        ensure => installed,
      }
    }
    if ( $java_package_type == 'sun' and $version >6 ) {
      exec { 'install_message':
        path      => '/bin',
        command   => 'echo "Sun java package above version 6, are not available for ${::operatingsystem}"',
        logoutput => true,
      }
    }
    elsif ( $java_package_type == 'openjdk' and $version == 6 ) {
      package { $openjdk6_package:
        ensure => installed,
      }
    }
    elsif ( $java_package_type == 'openjdk' and $version >6 ){
      exec { 'install_message':
        path      => '/bin',
        command   => 'echo "OpenJdk java package above version 6, are not available for ${::operatingsystem}"',
        logoutput => true,
      }
    }
  }
}
