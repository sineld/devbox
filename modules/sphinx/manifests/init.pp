class sphinx {
    $packages = [ 'sphinxsearch', 'sphinxbase-utils' ]
    package { $packages:
        ensure => installed,
    }

    # Replace the default sphinx.conf
    file { 'sphinx.conf':
        path => '/etc/sphinxsearch/sphinx.conf',
        ensure => file,
        owner => root,
        group => root,
        source => 'puppet:///modules/sphinx/sphinx.conf',
        require => Package['sphinxsearch'],
    }


    # Create the Directory where Sphinx places the .spl files
    file { '/var/db/sphinxsearch/data/myl':
        ensure => directory,
        owner  => root,
        group  => root,
        mode   => 750,
    }


    # Run the indexer
    exec { 'run-sphinx-indexer':
        command => "indexer --all",
    }


}

