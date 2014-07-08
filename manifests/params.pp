class java::params {
  $java_version   = ''
  $java_package_type = ''
  
  case $::osfamily {
    'RedHat': {
      
        $sunjava6_packages = ['jdk-6u5-linux-x64.rpm','jre-6u5-linux-x64.rpm']
        $sunjava7_packages = ['jdk-7u5-linux-x64.rpm','jre-7u5-linux-x64.rpm']
        $sunjava8_packages = ['jdk-8u5-linux-x64.rpm','jre-8u5-linux-x64.rpm']
        $openjdk_packages = ['java-1.6.0-openjdk.x86_64','java-1.6.0-openjdk-devel.x86_64']
        $openjdk7_packages = ['java-1.7.0-openjdk.x86_64','java-1.7.0-openjdk-devel.x86_64']
    }
    'Debian':{
        $sunjava6_packages = 'oracle-java6-installer'
        $sunjava7_packages = 'oracle-java7-installer'
        $sunjava8_packages = 'oracle-java8-installer'
        $openjdk6_packages = ['openjdk-6-jdk','openjdk-6-jre']
        $openjdk7_packages = ['openjdk-7-jdk','openjdk-7-jre']
      }
    }
    default: {
      fail("The ${module_name} module is not supported on an ${::osfamily} based system.")
    }
  }
