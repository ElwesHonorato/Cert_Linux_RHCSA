        # Faça a zona “dmz” ser a zona padrão.

[root@srv0 ~]# firewall-cmd --list-all
    public (active)
        target: default
        icmp-block-inversion: no
        interfaces: enp0s3
        sources:
        services: cockpit dhcpv6-client mountd myhttp nfs rpc-bind ssh
        ports:
        protocols:
        forward: yes
        masquerade: no
        forward-ports:
        source-ports:
        icmp-blocks:
        rich rules:
[root@srv0 ~]# firewall-cmd --get-zones
    block dmz drop external home internal nm-shared public trusted work
[root@srv0 ~]# firewall-cmd --set-default-zone=dmz
    success
[root@srv0 ~]# firewall-cmd --list-all
    dmz (active)
        target: default
        icmp-block-inversion: no
        interfaces: enp0s3
        sources:
        services: ssh
        ports:
        protocols:
        forward: yes
        masquerade: no
        forward-ports:
        source-ports:
        icmp-blocks:
        rich rules:
[root@srv0 ~]# firewall-cmd --info-zone=dmz
    dmz (active)
        target: default
        icmp-block-inversion: no
        interfaces: enp0s3
        sources:
        services: ssh
        ports:
        protocols:
        forward: yes
        masquerade: no
        forward-ports:
        source-ports:
        icmp-blocks:
        rich rules: