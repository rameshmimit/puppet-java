class java::repo::epel {
  
  case $::osfamily {

    RedHat: {
      require 'yum::repo::slideshare'
    }
    default: { }
  } 
}
