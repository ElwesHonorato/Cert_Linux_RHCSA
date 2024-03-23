##############################################################################################################
#### Discovery


[root@desk ~]# hostname
    desk.temweb.local
[root@desk ~]# cat /etc/hosts
    127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
    ::1         localhost localhost.localdomain localhost6 localhost6.localdomain6
    192.168.0.10    rhel.temweb.local
[root@desk ~]# ping rhel.temweb.local
    PING rhel.temweb.local (192.168.0.10) 56(84) bytes of data.
    64 bytes from rhel.temweb.local (192.168.0.10): icmp_seq=1 ttl=63 time=13.7 ms
    64 bytes from rhel.temweb.local (192.168.0.10): icmp_seq=2 ttl=64 time=2.37 ms
    64 bytes from rhel.temweb.local (192.168.0.10): icmp_seq=3 ttl=64 time=1.41 ms
    64 bytes from rhel.temweb.local (192.168.0.10): icmp_seq=4 ttl=64 time=1.67 ms
    64 bytes from rhel.temweb.local (192.168.0.10): icmp_seq=5 ttl=64 time=1.77 ms
    64 bytes from rhel.temweb.local (192.168.0.10): icmp_seq=6 ttl=64 time=1.61 ms
    64 bytes from rhel.temweb.local (192.168.0.10): icmp_seq=7 ttl=64 time=2.29 ms
    ^C
    --- rhel.temweb.local ping statistics ---
    7 packets transmitted, 7 received, 0% packet loss, time 6014ms
    rtt min/avg/max/mdev = 1.410/3.547/13.708/4.161 ms
[root@desk ~]# vi /etc/hosts
    127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
    ::1         localhost localhost.localdomain localhost6 localhost6.localdomain6
    192.168.0.10    rhel.temweb.local   rhel
[root@desk ~]# ping rhel
    PING hel.temweb.local (192.168.0.10) 56(84) bytes of data.
    64 bytes from hel.temweb.local (192.168.0.10): icmp_seq=1 ttl=64 time=1.29 ms
    64 bytes from hel.temweb.local (192.168.0.10): icmp_seq=2 ttl=64 time=2.49 ms
    64 bytes from hel.temweb.local (192.168.0.10): icmp_seq=3 ttl=64 time=1.72 ms
    64 bytes from hel.temweb.local (192.168.0.10): icmp_seq=4 ttl=64 time=1.60 ms
    64 bytes from hel.temweb.local (192.168.0.10): icmp_seq=5 ttl=64 time=1.20 ms
    64 bytes from hel.temweb.local (192.168.0.10): icmp_seq=6 ttl=64 time=1.26 ms
    64 bytes from hel.temweb.local (192.168.0.10): icmp_seq=7 ttl=64 time=1.73 ms
    64 bytes from hel.temweb.local (192.168.0.10): icmp_seq=8 ttl=64 time=1.64 ms
    ^C
    --- hel.temweb.local ping statistics ---
    8 packets transmitted, 8 received, 0% packet loss, time 7017ms
    rtt min/avg/max/mdev = 1.195/1.614/2.487/0.386 ms


# /-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-
# /-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-







































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
