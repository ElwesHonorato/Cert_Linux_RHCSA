##############################################################################################################
#### Discovery

[root@dev1 ~]# id elwes
    uid=1000(elwes) gid=1000(elwes) groups=1000(elwes)

[root@dev1 ~]# tail /etc/group
    elwes:x:1000:
    mike:x:1001:
    nginx:x:977:
    apache:x:48:
    teste1:x:1004:
    bia:x:3000:

[root@dev1 ~]# groupadd -g 4000 devs

[root@dev1 ~]# tail /etc/group
    mike:x:1001:
    nginx:x:977:
    apache:x:48:
    teste1:x:1004:
    bia:x:3000:
    devs:x:4000:

[root@dev1 ~]# id elwes
    uid=1000(elwes) gid=1000(elwes) groups=1000(elwes)


[root@dev1 ~]# usermod -aG devs elwes

[root@dev1 ~]# id elwes
    uid=1000(elwes) gid=1000(elwes) groups=1000(elwes),4000(devs)

[root@dev1 ~]# tail /etc/groups
    tail: cannot open '/etc/groups' for reading: No such file or directory

[root@dev1 ~]# tail /etc/group
    slocate:x:21:
    dnsmasq:x:978:
    tcpdump:x:72:
    elwes:x:1000:
    mike:x:1001:
    nginx:x:977:
    apache:x:48:
    teste1:x:1004:
    bia:x:3000:
    devs:x:4000:elwes
[root@dev1 ~]# usermod -aG devs bia

[root@dev1 ~]# tail /etc/group
    slocate:x:21:
    dnsmasq:x:978:
    tcpdump:x:72:
    elwes:x:1000:
    mike:x:1001:
    nginx:x:977:
    apache:x:48:
    teste1:x:1004:
    bia:x:3000:
    devs:x:4000:elwes,bia

[root@dev1 ~]# id elwes
    uid=1000(elwes) gid=1000(elwes) groups=1000(elwes),4000(devs)

[root@dev1 ~]# id bia
    uid=2400(bia) gid=3000(bia) groups=3000(bia),4000(devs)

[root@dev1 ~]# groupdel
    Usage: groupdel [options] GROUP

    Options:
      -h, --help                    display this help message and exit
      -R, --root CHROOT_DIR         directory to chroot into
      -P, --prefix PREFIX_DIR       prefix directory where are located the /etc/* files
      -f, --force                   delete group even if it is the primary group of a user

[root@dev1 ~]# groupdel devs

[root@dev1 ~]# tail /etc/group
    chrony:x:979:
    slocate:x:21:
    dnsmasq:x:978:
    tcpdump:x:72:
    elwes:x:1000:
    mike:x:1001:
    nginx:x:977:
    apache:x:48:
    teste1:x:1004:
    bia:x:3000:

[root@dev1 ~]# id elwes
    uid=1000(elwes) gid=1000(elwes) groups=1000(elwes)

[root@dev1 ~]# id bia
    uid=2400(bia) gid=3000(bia) groups=3000(bia)

[root@dev1 ~]# groupmod
    Usage: groupmod [options] GROUP

    Options:
      -a, --append                  append the users mentioned by -U option to the group
                                    without removing existing user members
      -g, --gid GID                 change the group ID to GID
      -h, --help                    display this help message and exit
      -n, --new-name NEW_GROUP      change the name to NEW_GROUP
      -o, --non-unique              allow to use a duplicate (non-unique) GID
      -p, --password PASSWORD       change the password to this (encrypted)
                                    PASSWORD
      -R, --root CHROOT_DIR         directory to chroot into
      -P, --prefix PREFIX_DIR       prefix directory where are located the /etc/* files
      -U, --users USERS             list of user members of this group

[root@dev1 ~]# groupmod -n teste2 -g 5000 teste1

[root@dev1 ~]# tail /etc/group
    chrony:x:979:
    slocate:x:21:
    dnsmasq:x:978:
    tcpdump:x:72:
    elwes:x:1000:
    mike:x:1001:
    nginx:x:977:
    apache:x:48:
    bia:x:3000:
    teste2:x:5000:






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
