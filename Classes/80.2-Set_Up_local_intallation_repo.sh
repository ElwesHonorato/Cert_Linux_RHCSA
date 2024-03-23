##############################################################################################################
#### Discovery

[root@dev1 ~]# dnf repolist
    repo id                                  repo name
    appstream                                CentOS Stream 9 - AppStream
    baseos                                   CentOS Stream 9 - BaseOS
    extras-common                            CentOS Stream 9 - Extras packages

[root@dev1 ~]# vi /etc/hosts
    127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
    ::1         localhost localhost.localdomain localhost6 localhost6.localdomain6
    192.168.0.10    rhel.temweb.local       rhel

[root@dev1 ~]# ping rhel.temweb.local
    PING rhel.temweb.local (192.168.0.10) 56(84) bytes of data.
    64 bytes from rhel.temweb.local (192.168.0.10): icmp_seq=1 ttl=63 time=9.75 ms

[root@dev1 ~]# ping rhel
    PING rhel.temweb.local (192.168.0.10) 56(84) bytes of data.
    64 bytes from rhel.temweb.local (192.168.0.10): icmp_seq=1 ttl=64 time=1.07 ms

[root@dev1 ~]# cd /etc/yum.repos.d

[root@dev1 yum.repos.d]# ls
    centos-addons.repo  centos.repo

[root@dev1 yum.repos.d]# vi myrepo.repo
    [my_BaseOS]
    name=my_baseos
    baseurl=http://rhel.temweb.local/BaseOS
    enabled=1
    gpgcheck=0

    [my_AppStream]
    name=my_appstream
    baseurl=http://rhel.temweb.local/AppStream
    enabled=1
    gpgcheck=0

[root@dev1 yum.repos.d]# dnf repolist
    repo id                                  repo name
    appstream                                CentOS Stream 9 - AppStream
    baseos                                   CentOS Stream 9 - BaseOS
    extras-common                            CentOS Stream 9 - Extras packages
    my_AppStream                             my_appstream
    my_BaseOS                                my_baseos


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
