class pi-nfs {

    $share_dir = '/share/'

    file { $share_dir:
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0777'
  } 

  include nfs::server
  ::nfs::server::export{ $share_dir:
    ensure  => 'mounted',
    clients => '192.168.1.0/24(rw,sync,no_subtree_check)',
  }

}
