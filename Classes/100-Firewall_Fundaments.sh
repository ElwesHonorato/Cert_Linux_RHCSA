##############################################################################################################
#### Discovery

#### Change Firewall Zone
[root@srv0 ~]# systemctl status httpd
    ● httpd.service - The Apache HTTP Server
        Loaded: loaded (/usr/lib/systemd/system/httpd.service; enabled; preset: disabled)
        Active: active (running) since Sun 2024-03-17 13:53:35 -03; 4min 22s ago
        Docs: man:httpd.service(8)
    Main PID: 946 (httpd)
        Status: "Total requests: 0; Idle/Busy workers 100/0;Requests/sec: 0; Bytes served/sec:   0 B/sec"
        Tasks: 177 (limit: 10812)
        Memory: 42.5M
        CPU: 638ms
        CGroup: /system.slice/httpd.service
                ├─946 /usr/sbin/httpd -DFOREGROUND
                ├─973 /usr/sbin/httpd -DFOREGROUND
                ├─975 /usr/sbin/httpd -DFOREGROUND
                ├─976 /usr/sbin/httpd -DFOREGROUND
                └─977 /usr/sbin/httpd -DFOREGROUND

    Mar 17 13:53:33 srv0.temweb.local systemd[1]: Starting The Apache HTTP Server...
    Mar 17 13:53:35 srv0.temweb.local httpd[946]: AH00558: httpd: Could not reliably determine the server>
    Mar 17 13:53:35 srv0.temweb.local httpd[946]: Server configured, listening on: port 80
    Mar 17 13:53:35 srv0.temweb.local systemd[1]: Started The Apache HTTP Server.

[root@srv0 ~]# firewall-cmd --get-zones
    block dmz drop external home internal nm-shared public trusted work
    
[root@srv0 ~]# firewall-cmd --list-all
    public (active)
        target: default
        icmp-block-inversion: no
        interfaces: enp0s3
        sources:
        services: cockpit dhcpv6-client http mountd nfs rpc-bind ssh
        ports:
        protocols:
        forward: yes
        masquerade: no
        forward-ports:
        source-ports:
        icmp-blocks:
        rich rules:

[root@srv0 ~]# firewall-cmd --list-all --zone=trusted
    trusted
        target: ACCEPT
        icmp-block-inversion: no
        interfaces:
        sources:
        services:
        ports:
        protocols:
        forward: yes
        masquerade: no
        forward-ports:
        source-ports:
        icmp-blocks:
        rich rules:


[root@srv0 ~]# firewall-cmd --get-default
    public  
[root@srv0 ~]# firewall-cmd --list-all --zone=block
    block
        target: %%REJECT%%
        icmp-block-inversion: no
        interfaces:
        sources:
        services:
        ports:
        protocols:
        forward: yes
        masquerade: no
        forward-ports:
        source-ports:
        icmp-blocks:
        rich rules:
[root@srv0 ~]# firewall-cmd --get-default-zone
    public

[root@srv0 ~]# firewall-cmd --list-all --zone=dmz
    dmz
      target: default
      icmp-block-inversion: no
      interfaces:
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

# /-/-/-/-/-/-/-/-/-/-/-/ ------------- desk ------------- /-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/
[root@desk ~]# telnet rhel 80
    Trying 192.168.0.10...
    Connected to rhel.
    Escape character is '^]'.

# /-/-/-/-/-/-/-/-/-/-/-/ ------------- srv0 ------------- /-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/
[root@srv0 ~]# firewall-cmd --set-defaul=dmz
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

# /-/-/-/-/-/-/-/-/-/-/-/ ------------- desk ------------- /-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/
[root@desk ~]# telnet rhel 80
    Trying 192.168.0.10...
    telnet: connect to address 192.168.0.10: No route to host
# /-/-/-/-/-/-/-/-/-/-/-/ ------------- srv0 ------------- /-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/
[root@srv0 ~]# firewall-cmd --add-service=http
    success

[root@srv0 ~]# firewall-cmd --list-all
    dmz (active)
        target: default
        icmp-block-inversion: no
        interfaces: enp0s3
        sources:
        services: http ssh
        ports:
        protocols:
        forward: yes
        masquerade: no
        forward-ports:
        source-ports:
        icmp-blocks:
        rich rules:

# /-/-/-/-/-/-/-/-/-/-/-/ ------------- desk ------------- /-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/
[root@desk ~]# telnet rhel 80
    Trying 192.168.0.10...
    Connected to rhel.
    Escape character is '^]'.

# /-/-/-/-/-/-/-/-/-/-/-/ ------------- srv0 ------------- /-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/
[root@srv0 ~]# firewall-cmd --reload
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

[root@desk ~]# telnet rhel 80
    Trying 192.168.0.10...
    telnet: connect to address 192.168.0.10: No route to host

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
[root@srv0 ~]# firewall-cmd --add-port=80/tcp
    success
[root@srv0 ~]# firewall-cmd --list-all
    dmz (active)
        target: default
        icmp-block-inversion: no
        interfaces: enp0s3
        sources:
        services: ssh
        ports: 80/tcp
        protocols:
        forward: yes
        masquerade: no
        forward-ports:
        source-ports:
        icmp-blocks:
        rich rules:

# /-/-/-/-/-/-/-/-/-/-/-/ ------------- desk ------------- /-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/
[root@desk ~]# telnet rhel 80
    Trying 192.168.0.10...
    Connected to rhel.
    Escape character is '^]'.

# /-/-/-/-/-/-/-/-/-/-/-/ ------------- srv0 ------------- /-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/
[root@srv0 ~]# firewall-cmd --reload
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

[root@srv0 ~]# firewall-cmd --set-default=public
    success

[root@srv0 ~]# firewall-cmd --list-all
    public (active)
        target: default
        icmp-block-inversion: no
        interfaces: enp0s3
        sources:
        services: cockpit dhcpv6-client http mountd nfs rpc-bind ssh
        ports:
        protocols:
        forward: yes
        masquerade: no
        forward-ports:
        source-ports:
        icmp-blocks:
        rich rules:


# /-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-
# /-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-


#### Change or Add services to the Firewall
[root@srv0 ~]# firewall-cmd --list-services
    cockpit dhcpv6-client http mountd nfs rpc-bind ssh

[root@srv0 ~]# firewall-cmd --info-service=http
    http
        ports: 80/tcp
        protocols:
        source-ports:
        modules:
        destination:
        includes:
        helpers:
        
[root@srv0 ~]# firewall-cmd --remove-service=http
    success

[root@srv0 ~]# firewall-cmd --list-services
   cockpit dhcpv6-client mountd nfs rpc-bind ssh

[root@srv0 ~]# firewall-cmd --reload
    success

[root@srv0 ~]# firewall-cmd --list-services
    cockpit dhcpv6-client http mountd nfs rpc-bind ssh

[root@srv0 ~]# firewall-cmd --permanent --remove-service=http
    success

[root@srv0 ~]# firewall-cmd --list-services
    cockpit dhcpv6-client http mountd nfs rpc-bind ssh

[root@srv0 ~]# firewall-cmd --reload
    success

[root@srv0 ~]# firewall-cmd --list-services
    cockpit dhcpv6-client mountd nfs rpc-bind ssh

[root@srv0 ~]# firewall-cmd --add-service=http
    success

[root@srv0 ~]# firewall-cmd --list-services
    cockpit dhcpv6-client http mountd nfs rpc-bind ssh

[root@srv0 ~]# firewall-cmd --runtime-to-permanent
    success

[root@srv0 ~]# firewall-cmd --list-services
    cockpit dhcpv6-client http mountd nfs rpc-bind ssh

[root@srv0 ~]# firewall-cmd --reload
    success
    
[root@srv0 ~]# firewall-cmd --list-services
    cockpit dhcpv6-client http mountd nfs rpc-bind ssh
































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
