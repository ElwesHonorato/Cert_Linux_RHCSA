##############################################################################################################
#### Discovery

[root@dev1 ~]# nmcli d s
    DEVICE  TYPE      STATE                   CONNECTION
    enp0s3  ethernet  connected               enp0s3
    lo      loopback  connected (externally)  lo
    [root@dev1 ~]# nmcli c s
    NAME    UUID                                  TYPE      DEVICE
    enp0s3  8a3bbb85-98ac-3ef8-a837-fe412304132d  ethernet  enp0s3
    lo      6b61b9b1-2162-4004-bf04-664a214cb9cc  loopback  lo

[root@dev1 ~]# nmcli c s enp0s3 | grep ipv4
    ipv4.method:                            manual
    ipv4.dns:                               1.1.1.1,1.0.0.1
    ipv4.dns-search:                        --
    ipv4.dns-options:                       --
    ipv4.dns-priority:                      0
    ipv4.addresses:                         192.168.0.100/24
    ipv4.gateway:                           192.168.0.1
    ipv4.routes:                            --
    ipv4.route-metric:                      -1
    ipv4.route-table:                       0 (unspec)
    ipv4.routing-rules:                     --
    ipv4.replace-local-rule:                -1 (default)
    ipv4.ignore-auto-routes:                no
    ipv4.ignore-auto-dns:                   no
    ipv4.dhcp-client-id:                    --
    ipv4.dhcp-iaid:                         --
    ipv4.dhcp-dscp:                         --
    ipv4.dhcp-timeout:                      0 (default)
    ipv4.dhcp-send-hostname:                yes
    ipv4.dhcp-hostname:                     --
    ipv4.dhcp-fqdn:                         --
    ipv4.dhcp-hostname-flags:               0x0 (none)
    ipv4.never-default:                     no
    ipv4.may-fail:                          yes
    ipv4.required-timeout:                  -1 (default)
    ipv4.dad-timeout:                       -1 (default)
    ipv4.dhcp-vendor-class-identifier:      --
    ipv4.link-local:                        0 (default)
    ipv4.dhcp-reject-servers:               --
    ipv4.auto-route-ext-gw:                 -1 (default)

[root@dev1 ~]# nmcli d s
    DEVICE  TYPE      STATE                   CONNECTION
    enp0s3  ethernet  connected               enp0s3
    lo      loopback  connected (externally)  lo

[root@dev1 ~]# nmcli c add con-name mycon type ethernet ifname enp1s0
    Connection 'mycon' (15c53ec2-f57a-4858-89bc-b6c00ee184fb) successfully added.

[root@dev1 ~]# nmcli c s
    NAME    UUID                                  TYPE      DEVICE
    enp0s3  8a3bbb85-98ac-3ef8-a837-fe412304132d  ethernet  enp0s3
    lo      6b61b9b1-2162-4004-bf04-664a214cb9cc  loopback  lo
    mycon   15c53ec2-f57a-4858-89bc-b6c00ee184fb  ethernet  --

[root@dev1 ~]# nmcli c s mycon | grep ipv4
    ipv4.method:                            auto
    ipv4.dns:                               --
    ipv4.dns-search:                        --
    ipv4.dns-options:                       --
    ipv4.dns-priority:                      0
    ipv4.addresses:                         --
    ipv4.gateway:                           --
    ipv4.routes:                            --
    ipv4.route-metric:                      -1
    ipv4.route-table:                       0 (unspec)
    ipv4.routing-rules:                     --
    ipv4.replace-local-rule:                -1 (default)
    ipv4.ignore-auto-routes:                no
    ipv4.ignore-auto-dns:                   no
    ipv4.dhcp-client-id:                    --
    ipv4.dhcp-iaid:                         --
    ipv4.dhcp-dscp:                         --
    ipv4.dhcp-timeout:                      0 (default)
    ipv4.dhcp-send-hostname:                yes
    ipv4.dhcp-hostname:                     --
    ipv4.dhcp-fqdn:                         --
    ipv4.dhcp-hostname-flags:               0x0 (none)
    ipv4.never-default:                     no
    ipv4.may-fail:                          yes
    ipv4.required-timeout:                  -1 (default)
    ipv4.dad-timeout:                       -1 (default)
    ipv4.dhcp-vendor-class-identifier:      --
    ipv4.link-local:                        0 (default)
    ipv4.dhcp-reject-servers:               --
    ipv4.auto-route-ext-gw:                 -1 (default)

[root@dev1 ~]# nmcli c m mycon ipv4.method manual
    Error: Failed to modify connection 'mycon': ipv4.method: method 'manual' requires at least an address or a route

[root@dev1 ~]# nmcli c m mycon ipv4.method manual ipv4.addresses 192.168.0.99/24

[root@dev1 ~]# nmcli c s mycon | grep ipv4
    ipv4.method:                            manual
    ipv4.dns:                               --
    ipv4.dns-search:                        --
    ipv4.dns-options:                       --
    ipv4.dns-priority:                      0
    ipv4.addresses:                         192.168.0.99/24
    ipv4.gateway:                           --
    ipv4.routes:                            --
    ipv4.route-metric:                      -1
    ipv4.route-table:                       0 (unspec)
    ipv4.routing-rules:                     --
    ipv4.replace-local-rule:                -1 (default)
    ipv4.ignore-auto-routes:                no
    ipv4.ignore-auto-dns:                   no
    ipv4.dhcp-client-id:                    --
    ipv4.dhcp-iaid:                         --
    ipv4.dhcp-dscp:                         --
    ipv4.dhcp-timeout:                      0 (default)
    ipv4.dhcp-send-hostname:                yes
    ipv4.dhcp-hostname:                     --
    ipv4.dhcp-fqdn:                         --
    ipv4.dhcp-hostname-flags:               0x0 (none)
    ipv4.never-default:                     no
    ipv4.may-fail:                          yes
    ipv4.required-timeout:                  -1 (default)
    ipv4.dad-timeout:                       -1 (default)
    ipv4.dhcp-vendor-class-identifier:      --
    ipv4.link-local:                        0 (default)
    ipv4.dhcp-reject-servers:               --
    ipv4.auto-route-ext-gw:                 -1 (default)

[root@dev1 ~]# nmcli c s mycon | grep ipv4
    ipv4.method:                            manual
    ipv4.dns:                               --
    ipv4.dns-search:                        --
    ipv4.dns-options:                       --
    ipv4.dns-priority:                      0
    ipv4.addresses:                         192.168.0.99/24
    ipv4.gateway:                           --
    ipv4.routes:                            --
    ipv4.route-metric:                      -1
    ipv4.route-table:                       0 (unspec)
    ipv4.routing-rules:                     --
    ipv4.replace-local-rule:                -1 (default)
    ipv4.ignore-auto-routes:                no
    ipv4.ignore-auto-dns:                   no
    ipv4.dhcp-client-id:                    --
    ipv4.dhcp-iaid:                         --
    ipv4.dhcp-dscp:                         --
    ipv4.dhcp-timeout:                      0 (default)
    ipv4.dhcp-send-hostname:                yes
    ipv4.dhcp-hostname:                     --
    ipv4.dhcp-fqdn:                         --
    ipv4.dhcp-hostname-flags:               0x0 (none)
    ipv4.never-default:                     no
    ipv4.may-fail:                          yes
    ipv4.required-timeout:                  -1 (default)
    ipv4.dad-timeout:                       -1 (default)
    ipv4.dhcp-vendor-class-identifier:      --
    ipv4.link-local:                        0 (default)
    ipv4.dhcp-reject-servers:               --
    ipv4.auto-route-ext-gw:                 -1 (default)

[root@dev1 ~]# nmcli c m mycon +ipv4.dns 1.1.1.1 +ipv4.dns 1.0.0.1

[root@dev1 ~]# nmcli c s mycon | grep ipv4
    ipv4.method:                            manual
    ipv4.dns:                               1.1.1.1,1.0.0.1
    ipv4.dns-search:                        --
    ipv4.dns-options:                       --
    ipv4.dns-priority:                      0
    ipv4.addresses:                         192.168.0.99/24
    ipv4.gateway:                           --
    ipv4.routes:                            --
    ipv4.route-metric:                      -1
    ipv4.route-table:                       0 (unspec)
    ipv4.routing-rules:                     --
    ipv4.replace-local-rule:                -1 (default)
    ipv4.ignore-auto-routes:                no
    ipv4.ignore-auto-dns:                   no
    ipv4.dhcp-client-id:                    --
    ipv4.dhcp-iaid:                         --
    ipv4.dhcp-dscp:                         --
    ipv4.dhcp-timeout:                      0 (default)
    ipv4.dhcp-send-hostname:                yes
    ipv4.dhcp-hostname:                     --
    ipv4.dhcp-fqdn:                         --
    ipv4.dhcp-hostname-flags:               0x0 (none)
    ipv4.never-default:                     no
    ipv4.may-fail:                          yes
    ipv4.required-timeout:                  -1 (default)
    ipv4.dad-timeout:                       -1 (default)
    ipv4.dhcp-vendor-class-identifier:      --
    ipv4.link-local:                        0 (default)
    ipv4.dhcp-reject-servers:               --
    ipv4.auto-route-ext-gw:                 -1 (default)

[root@dev1 ~]# nmcli c m mycon ipv4.gateway 192.168.0.1

[root@dev1 ~]# nmcli c s mycon | grep ipv4
    ipv4.method:                            manual
    ipv4.dns:                               1.1.1.1,1.0.0.1
    ipv4.dns-search:                        --
    ipv4.dns-options:                       --
    ipv4.dns-priority:                      0
    ipv4.addresses:                         192.168.0.99/24
    ipv4.gateway:                           192.168.0.1
    ipv4.routes:                            --
    ipv4.route-metric:                      -1
    ipv4.route-table:                       0 (unspec)
    ipv4.routing-rules:                     --
    ipv4.replace-local-rule:                -1 (default)
    ipv4.ignore-auto-routes:                no
    ipv4.ignore-auto-dns:                   no
    ipv4.dhcp-client-id:                    --
    ipv4.dhcp-iaid:                         --
    ipv4.dhcp-dscp:                         --
    ipv4.dhcp-timeout:                      0 (default)
    ipv4.dhcp-send-hostname:                yes
    ipv4.dhcp-hostname:                     --
    ipv4.dhcp-fqdn:                         --
    ipv4.dhcp-hostname-flags:               0x0 (none)
    ipv4.never-default:                     no
    ipv4.may-fail:                          yes
    ipv4.required-timeout:                  -1 (default)
    ipv4.dad-timeout:                       -1 (default)
    ipv4.dhcp-vendor-class-identifier:      --
    ipv4.link-local:                        0 (default)
    ipv4.dhcp-reject-servers:               --
    ipv4.auto-route-ext-gw:                 -1 (default)

[root@dev1 ~]# nmcli c s mycon | grep connect
    connection.id:                          mycon
    connection.uuid:                        15c53ec2-f57a-4858-89bc-b6c00ee184fb
    connection.stable-id:                   --
    connection.type:                        802-3-ethernet
    connection.interface-name:              enp1s0
    connection.autoconnect:                 yes
    connection.autoconnect-priority:        0
    connection.autoconnect-retries:         -1 (default)
    connection.multi-connect:               0 (default)
    connection.auth-retries:                -1
    connection.timestamp:                   0
    connection.permissions:                 --
    connection.zone:                        --
    connection.controller:                  --
    connection.master:                      --
    connection.slave-type:                  --
    connection.port-type:                   --
    connection.autoconnect-slaves:          -1 (default)
    connection.autoconnect-ports:           -1 (default)
    connection.secondaries:                 --
    connection.gateway-ping-timeout:        0
    connection.metered:                     unknown
    connection.lldp:                        default
    connection.mdns:                        -1 (default)
    connection.llmnr:                       -1 (default)
    connection.dns-over-tls:                -1 (default)
    connection.mptcp-flags:                 0x0 (default)
    connection.wait-device-timeout:         -1
    connection.wait-activation-delay:       -1

[root@dev1 ~]# nmcli c s enp0s3 | grep connect
    connection.id:                          enp0s3
    connection.uuid:                        8a3bbb85-98ac-3ef8-a837-fe412304132d
    connection.stable-id:                   --
    connection.type:                        802-3-ethernet
    connection.interface-name:              enp0s3
    connection.autoconnect:                 yes
    connection.autoconnect-priority:        -999
    connection.autoconnect-retries:         -1 (default)
    connection.multi-connect:               0 (default)
    connection.auth-retries:                -1
    connection.timestamp:                   1710138984
    connection.permissions:                 --
    connection.zone:                        --
    connection.controller:                  --
    connection.master:                      --
    connection.slave-type:                  --
    connection.port-type:                   --
    connection.autoconnect-slaves:          -1 (default)
    connection.autoconnect-ports:           -1 (default)
    connection.secondaries:                 --
    connection.gateway-ping-timeout:        0
    connection.metered:                     unknown
    connection.lldp:                        default
    connection.mdns:                        -1 (default)
    connection.llmnr:                       -1 (default)
    connection.dns-over-tls:                -1 (default)
    connection.mptcp-flags:                 0x0 (default)
    connection.wait-device-timeout:         -1
    connection.wait-activation-delay:       -1
[root@dev1 ~]# nmcli c m mycon connection.autoconnect 0

[root@dev1 ~]# nmcli c s mycon | grep connection
    connection.id:                          mycon
    connection.uuid:                        15c53ec2-f57a-4858-89bc-b6c00ee184fb
    connection.stable-id:                   --
    connection.type:                        802-3-ethernet
    connection.interface-name:              enp1s0
    connection.autoconnect:                 no
    connection.autoconnect-priority:        0
    connection.autoconnect-retries:         -1 (default)
    connection.multi-connect:               0 (default)
    connection.auth-retries:                -1
    connection.timestamp:                   0
    connection.permissions:                 --
    connection.zone:                        --
    connection.controller:                  --
    connection.master:                      --
    connection.slave-type:                  --
    connection.port-type:                   --
    connection.autoconnect-slaves:          -1 (default)
    connection.autoconnect-ports:           -1 (default)
    connection.secondaries:                 --
    connection.gateway-ping-timeout:        0
    connection.metered:                     unknown
    connection.lldp:                        default
    connection.mdns:                        -1 (default)
    connection.llmnr:                       -1 (default)
    connection.dns-over-tls:                -1 (default)
    connection.mptcp-flags:                 0x0 (default)
    connection.wait-device-timeout:         -1
    connection.wait-activation-delay:       -1

[root@dev1 ~]# nmcli d s
    DEVICE  TYPE      STATE                   CONNECTION
    enp0s3  ethernet  connected               enp0s3
    lo      loopback  connected (externally)  lo

[root@dev1 ~]# nmcli c s
    NAME    UUID                                  TYPE      DEVICE
    enp0s3  8a3bbb85-98ac-3ef8-a837-fe412304132d  ethernet  enp0s3
    lo      6b61b9b1-2162-4004-bf04-664a214cb9cc  loopback  lo
    mycon   15c53ec2-f57a-4858-89bc-b6c00ee184fb  ethernet  --

[root@dev1 ~]# ip a
    1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
        link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
        inet 127.0.0.1/8 scope host lo
           valid_lft forever preferred_lft forever
        inet6 ::1/128 scope host
           valid_lft forever preferred_lft forever
    2: enp0s3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
        link/ether 08:00:27:72:28:a6 brd ff:ff:ff:ff:ff:ff
        inet 192.168.0.100/24 brd 192.168.0.255 scope global noprefixroute enp0s3
           valid_lft forever preferred_lft forever
        inet6 2804:14c:d4:85f5:a00:27ff:fe72:28a6/64 scope global dynamic noprefixroute
           valid_lft 86385sec preferred_lft 71985sec
        inet6 fe80::a00:27ff:fe72:28a6/64 scope link noprefixroute
           valid_lft forever preferred_lft forever
[root@dev1 ~]# nmcli c up mycon
    Error: Connection activation failed: No suitable device found for this connection (device enp0s3 not available because profile is not compatible with device (mismatching interface name)).

[root@dev1 ~]# nmcli d s
    DEVICE  TYPE      STATE                   CONNECTION
    enp0s3  ethernet  connected               enp0s3
    lo      loopback  connected (externally)  lo

[root@dev1 ~]# nmcli c s enp0s3 | grep enp0s3
    connection.id:                          enp0s3
    connection.interface-name:              enp0s3
    GENERAL.NAME:                           enp0s3
    GENERAL.DEVICES:                        enp0s3
    GENERAL.IP-IFACE:                       enp0s3

[root@dev1 ~]# nmcli c m mycon connection.interface-name enp0s3

[root@dev1 ~]# nmcli c s mycon | grep enp0s3
    connection.interface-name:              enp0s3

client_loop: send disconnect: Connection reset
PS C:\Users\elwes> ssh -l root 192.168.0.99
    The authenticity of host '192.168.0.99 (192.168.0.99)' can't be established.
    ED25519 key fingerprint is SHA256:SvPXbo8uTv5mfYM3ObiPv8NEC3syVwUolJTcv96i+jk.
    This host key is known by the following other names/addresses:
        C:\Users\elwes/.ssh/known_hosts:1: 192.168.0.100
        C:\Users\elwes/.ssh/known_hosts:4: 192.168.0.10
        C:\Users\elwes/.ssh/known_hosts:5: 192.168.0.50
    Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
    Warning: Permanently added '192.168.0.99' (ED25519) to the list of known hosts.
    root@192.168.0.99's password:
    Activate the web console with: systemctl enable --now cockpit.socket

    Last login: Tue Mar 12 01:20:40 2024
[root@dev1 ~]#

[root@dev1 ~]# reboot
[root@dev1 ~]# Connection to 192.168.0.99 closed by remote host.
    Connection to 192.168.0.99 closed.
    PS C:\Users\elwes> ssh -l root 192.168.0.100
    root@192.168.0.100''s password:
    Activate the web console with: systemctl enable --now cockpit.socket

    Last login: Tue Mar 12 01:44:49 2024 from 192.168.0.6

[root@dev1 ~]# nmcli c s
    NAME    UUID                                  TYPE      DEVICE
    enp0s3  8a3bbb85-98ac-3ef8-a837-fe412304132d  ethernet  enp0s3
    lo      aa8a88ea-ec21-4d20-a790-98a2f4492f64  loopback  lo
    mycon   15c53ec2-f57a-4858-89bc-b6c00ee184fb  ethernet  --
##################################################################################################################################
##################################################################################################################################
##################################################################################################################################



##################################################################################################################################
##################################################################################################################################
##################################################################################################################################



##################################################################################################################################
##################################################################################################################################
##################################################################################################################################



##################################################################################################################################
##################################################################################################################################
##################################################################################################################################
