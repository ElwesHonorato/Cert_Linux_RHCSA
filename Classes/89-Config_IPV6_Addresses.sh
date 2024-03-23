 ##############################################################################################################
#### Discovery

https://www.redhat.com/en/blog/rhel-9-networking-say-goodbye-ifcfg-files-and-hello-keyfiles
[root@dev1 ~]# nmcli c s
    NAME    UUID                                  TYPE      DEVICE
    enp0s3  8a3bbb85-98ac-3ef8-a837-fe412304132d  ethernet  enp0s3
    lo      aa8a88ea-ec21-4d20-a790-98a2f4492f64  loopback  lo
    mycon   15c53ec2-f57a-4858-89bc-b6c00ee184fb  ethernet  --
[root@dev1 ~]# cd /etc/NetworkManager/system-connections

[root@dev1 system-connections]# ls -ltr
    total 8
    -rw-------. 1 root root 290 Feb 24 20:09 enp0s3.nmconnection
    -rw-------. 1 root root 261 Mar 12 01:40 mycon.nmconnection
[root@dev1 system-connections]# cat enp0s3.nmconnection
    [connection]
    id=enp0s3
    uuid=8a3bbb85-98ac-3ef8-a837-fe412304132d
    type=ethernet
    autoconnect-priority=-999
    interface-name=enp0s3
    timestamp=1708815504

    [ethernet]

    [ipv4]
    address1=192.168.0.100/24,192.168.0.1
    dns=1.1.1.1;1.0.0.1;
    method=manual

    [ipv6]
    addr-gen-mode=eui64
    method=auto

    [proxy]
[root@dev1 system-connections]# nmcli c s enp0s3 | grep -i ipv6
    ipv6.method:                            auto
    ipv6.dns:                               --
    ipv6.dns-search:                        --
    ipv6.dns-options:                       --
    ipv6.dns-priority:                      0
    ipv6.addresses:                         --
    ipv6.gateway:                           --
    ipv6.routes:                            --
    ipv6.route-metric:                      -1
    ipv6.route-table:                       0 (unspec)
    ipv6.routing-rules:                     --
    ipv6.replace-local-rule:                -1 (default)
    ipv6.ignore-auto-routes:                no
    ipv6.ignore-auto-dns:                   no
    ipv6.never-default:                     no
    ipv6.may-fail:                          yes
    ipv6.required-timeout:                  -1 (default)
    ipv6.ip6-privacy:                       -1 (unknown)
    ipv6.addr-gen-mode:                     eui64
    ipv6.ra-timeout:                        0 (default)
    ipv6.mtu:                               auto
    ipv6.dhcp-pd-hint:                      --
    ipv6.dhcp-duid:                         --
    ipv6.dhcp-iaid:                         --
    ipv6.dhcp-timeout:                      0 (default)
    ipv6.dhcp-send-hostname:                yes
    ipv6.dhcp-hostname:                     --
    ipv6.dhcp-hostname-flags:               0x0 (none)
    ipv6.auto-route-ext-gw:                 -1 (default)
    ipv6.token:                             --

[root@dev1 system-connections]# ip a
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
           valid_lft 86386sec preferred_lft 71986sec
        inet6 fe80::a00:27ff:fe72:28a6/64 scope link noprefixroute
           valid_lft forever preferred_lft forever
       
[root@dev1 system-connections]# ip
    Usage: ip [ OPTIONS ] OBJECT { COMMAND | help }
           ip [ -force ] -batch filename
    where  OBJECT := { address | addrlabel | amt | fou | help | ila | ioam | l2tp |
                       link | macsec | maddress | monitor | mptcp | mroute | mrule |
                       neighbor | neighbour | netconf | netns | nexthop | ntable |
                       ntbl | route | rule | sr | tap | tcpmetrics |
                       token | tunnel | tuntap | vrf | xfrm }
           OPTIONS := { -V[ersion] | -s[tatistics] | -d[etails] | -r[esolve] |
                        -h[uman-readable] | -iec | -j[son] | -p[retty] |
                        -f[amily] { inet | inet6 | mpls | bridge | link } |
                        -4 | -6 | -M | -B | -0 |
                        -l[oops] { maximum-addr-flush-attempts } | -br[ief] |
                        -o[neline] | -t[imestamp] | -ts[hort] | -b[atch] [filename] |
                        -rc[vbuf] [size] | -n[etns] name | -N[umeric] | -a[ll] |
                        -c[olor]}

[root@dev1 system-connections]# ip route
    # default via 192.168.0.1 dev enp0s3 proto static metric 100
    # 192.168.0.0/24 dev enp0s3 proto kernel scope link src 192.168.0.100 metric 100
















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
