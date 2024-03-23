# Adicione o serviço "proxy_reversa" de forma permanente a zona dmz.

[root@srv0 ~]# firewall-cmd --permanent --add-service=proxy_reversa
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
[root@srv0 ~]# firewall-cmd --reload
    success
[root@srv0 ~]# firewall-cmd --list-all
    dmz (active)
        target: default
        icmp-block-inversion: no
        interfaces: enp0s3
        sources:
        services: proxy_reversa ssh
        ports:
        protocols:
        forward: yes
        masquerade: no
        forward-ports:
        source-ports:
        icmp-blocks:
        rich rules: