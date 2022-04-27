class base inherits base::params {

    package { [ 'tree', 'wget', 'git', 'unzip', 'ntp' ]:}

    file { '/etc/motd':
        owner   => 'root',
        group   => 'root',
        mode    => '0644',
        content => "

            SYSTEM INFO:
            ============
            
            IPADDRESS           :   ${::ipaddress}
            HOSTNAME            :   ${::hostname}
            MEMORY              :   ${::memory['system']['total']}
            CPU CORES           :   ${::processors['count']}
            OPERATING SYSTEM    :   ${::os['name']} ${::os['release']['full']}

        ",
    }

    service { $::base::ntp_service:
        ensure  => running,
        enable  => true,
    }

}
