##############################################################################################################
#### Discovery


[root@dev1 ~]# useradd
    Usage: useradd [options] LOGIN
           useradd -D
           useradd -D [options]

    Options:
          --badname                 do not check for bad names
      -b, --base-dir BASE_DIR       base directory for the home directory of the
                                    new account
          --btrfs-subvolume-home    use BTRFS subvolume for home directory
      -c, --comment COMMENT         GECOS field of the new account
      -d, --home-dir HOME_DIR       home directory of the new account
      -D, --defaults                print or change default useradd configuration
      -e, --expiredate EXPIRE_DATE  expiration date of the new account
      -f, --inactive INACTIVE       password inactivity period of the new account
      -g, --gid GROUP               name or ID of the primary group of the new
                                    account
      -G, --groups GROUPS           list of supplementary groups of the new
                                    account
      -h, --help                    display this help message and exit
      -k, --skel SKEL_DIR           use this alternative skeleton directory
      -K, --key KEY=VALUE           override /etc/login.defs defaults
      -l, --no-log-init             do not add the user to the lastlog and
                                    faillog databases
      -m, --create-home             create the user's home directory
      -M, --no-create-home          do not create the user's home directory
      -N, --no-user-group           do not create a group with the same name as
                                    the user
      -o, --non-unique              allow to create users with duplicate
                                    (non-unique) UID
      -p, --password PASSWORD       encrypted password of the new account
      -r, --system                  create a system account
      -R, --root CHROOT_DIR         directory to chroot into
      -P, --prefix PREFIX_DIR       prefix directory where are located the /etc/* files
      -s, --shell SHELL             login shell of the new account
      -u, --uid UID                 user ID of the new account
      -U, --user-group              create a group with the same name as the user
      -Z, --selinux-user SEUSER     use a specific SEUSER for the SELinux user mapping

[root@dev1 ~]# useradd joana

[root@dev1 ~]# tail /etc/passwd
    rpcuser:x:29:29:RPC Service User:/var/lib/nfs:/sbin/nologin
    sshd:x:74:74:Privilege-separated SSH:/usr/share/empty.sshd:/usr/sbin/nologin
    chrony:x:981:979:chrony system user:/var/lib/chrony:/sbin/nologin
    dnsmasq:x:980:978:Dnsmasq DHCP and DNS server:/var/lib/dnsmasq:/usr/sbin/nologin
    tcpdump:x:72:72::/:/sbin/nologin
    elwes:x:1000:1000:elwes:/home/elwes:/bin/bash
    mike:x:1001:1001::/home/mike:/bin/bash
    nginx:x:979:977:Nginx web server:/var/lib/nginx:/sbin/nologin
    apache:x:48:48:Apache:/usr/share/httpd:/sbin/nologin
    joana:x:1002:1002::/home/joana:/bin/bash

[root@dev1 ~]# usermod
    Usage: usermod [options] LOGIN

    Options:
      -b, --badname                 allow bad names
      -c, --comment COMMENT         new value of the GECOS field
      -d, --home HOME_DIR           new home directory for the user account
      -e, --expiredate EXPIRE_DATE  set account expiration date to EXPIRE_DATE
      -f, --inactive INACTIVE       set password inactive after expiration
                                    to INACTIVE
      -g, --gid GROUP               force use GROUP as new primary group
      -G, --groups GROUPS           new list of supplementary GROUPS
      -a, --append                  append the user to the supplemental GROUPS
                                    mentioned by the -G option without removing
                                    the user from other groups
      -h, --help                    display this help message and exit
      -l, --login NEW_LOGIN         new value of the login name
      -L, --lock                    lock the user account
      -m, --move-home               move contents of the home directory to the
                                    new location (use only with -d)
      -o, --non-unique              allow using duplicate (non-unique) UID
      -p, --password PASSWORD       use encrypted password for the new password
      -R, --root CHROOT_DIR         directory to chroot into
      -P, --prefix PREFIX_DIR       prefix directory where are located the /etc/* files
      -s, --shell SHELL             new login shell for the user account
      -u, --uid UID                 new UID for the user account
      -U, --unlock                  unlock the user account
      -v, --add-subuids FIRST-LAST  add range of subordinate uids
      -V, --del-subuids FIRST-LAST  remove range of subordinate uids
      -w, --add-subgids FIRST-LAST  add range of subordinate gids
      -W, --del-subgids FIRST-LAST  remove range of subordinate gids
      -Z, --selinux-user SEUSER     new SELinux user mapping for the user account

[root@dev1 ~]# usermod -c "Human Resources" joana

[root@dev1 ~]# tail /etc/passwd
    rpcuser:x:29:29:RPC Service User:/var/lib/nfs:/sbin/nologin
    sshd:x:74:74:Privilege-separated SSH:/usr/share/empty.sshd:/usr/sbin/nologin
    chrony:x:981:979:chrony system user:/var/lib/chrony:/sbin/nologin
    dnsmasq:x:980:978:Dnsmasq DHCP and DNS server:/var/lib/dnsmasq:/usr/sbin/nologin
    tcpdump:x:72:72::/:/sbin/nologin
    elwes:x:1000:1000:elwes:/home/elwes:/bin/bash
    mike:x:1001:1001::/home/mike:/bin/bash
    nginx:x:979:977:Nginx web server:/var/lib/nginx:/sbin/nologin
    apache:x:48:48:Apache:/usr/share/httpd:/sbin/nologin
    joana:x:1002:1002:Human Resources:/home/joana:/bin/bash

[root@dev1 ~]# useradd -s /sbin/nologin bob

[root@dev1 ~]# tail /etc/passwd
    sshd:x:74:74:Privilege-separated SSH:/usr/share/empty.sshd:/usr/sbin/nologin
    chrony:x:981:979:chrony system user:/var/lib/chrony:/sbin/nologin
    dnsmasq:x:980:978:Dnsmasq DHCP and DNS server:/var/lib/dnsmasq:/usr/sbin/nologin
    tcpdump:x:72:72::/:/sbin/nologin
    elwes:x:1000:1000:elwes:/home/elwes:/bin/bash
    mike:x:1001:1001::/home/mike:/bin/bash
    nginx:x:979:977:Nginx web server:/var/lib/nginx:/sbin/nologin
    apache:x:48:48:Apache:/usr/share/httpd:/sbin/nologin
    joana:x:1002:1002:Human Resources:/home/joana:/bin/bash
    bob:x:1003:1003::/home/bob:/sbin/nologin

[root@dev1 ~]# usermod -c "Without Login" bob

[root@dev1 ~]# tail /etc/passwd
    sshd:x:74:74:Privilege-separated SSH:/usr/share/empty.sshd:/usr/sbin/nologin
    chrony:x:981:979:chrony system user:/var/lib/chrony:/sbin/nologin
    dnsmasq:x:980:978:Dnsmasq DHCP and DNS server:/var/lib/dnsmasq:/usr/sbin/nologin
    tcpdump:x:72:72::/:/sbin/nologin
    elwes:x:1000:1000:elwes:/home/elwes:/bin/bash
    mike:x:1001:1001::/home/mike:/bin/bash
    nginx:x:979:977:Nginx web server:/var/lib/nginx:/sbin/nologin
    apache:x:48:48:Apache:/usr/share/httpd:/sbin/nologin
    joana:x:1002:1002:Human Resources:/home/joana:/bin/bash
    bob:x:1003:1003:Without Login:/home/bob:/sbin/nologin
[root@dev1 ~]# groupadd teste1

[root@dev1 ~]# usermod
    Usage: usermod [options] LOGIN

    Options:
      -b, --badname                 allow bad names
      -c, --comment COMMENT         new value of the GECOS field
      -d, --home HOME_DIR           new home directory for the user account
      -e, --expiredate EXPIRE_DATE  set account expiration date to EXPIRE_DATE
      -f, --inactive INACTIVE       set password inactive after expiration
                                    to INACTIVE
      -g, --gid GROUP               force use GROUP as new primary group
      -G, --groups GROUPS           new list of supplementary GROUPS
      -a, --append                  append the user to the supplemental GROUPS
                                    mentioned by the -G option without removing
                                    the user from other groups
      -h, --help                    display this help message and exit
      -l, --login NEW_LOGIN         new value of the login name
      -L, --lock                    lock the user account
      -m, --move-home               move contents of the home directory to the
                                    new location (use only with -d)
      -o, --non-unique              allow using duplicate (non-unique) UID
      -p, --password PASSWORD       use encrypted password for the new password
      -R, --root CHROOT_DIR         directory to chroot into
      -P, --prefix PREFIX_DIR       prefix directory where are located the /etc/* files
      -s, --shell SHELL             new login shell for the user account
      -u, --uid UID                 new UID for the user account
      -U, --unlock                  unlock the user account
      -v, --add-subuids FIRST-LAST  add range of subordinate uids
      -V, --del-subuids FIRST-LAST  remove range of subordinate uids
      -w, --add-subgids FIRST-LAST  add range of subordinate gids
      -W, --del-subgids FIRST-LAST  remove range of subordinate gids
      -Z, --selinux-user SEUSER     new SELinux user mapping for the user account

[root@dev1 ~]# usermod -aG teste1 joana

[root@dev1 ~]# tail /etc/passwd
    sshd:x:74:74:Privilege-separated SSH:/usr/share/empty.sshd:/usr/sbin/nologin
    chrony:x:981:979:chrony system user:/var/lib/chrony:/sbin/nologin
    dnsmasq:x:980:978:Dnsmasq DHCP and DNS server:/var/lib/dnsmasq:/usr/sbin/nologin
    tcpdump:x:72:72::/:/sbin/nologin
    elwes:x:1000:1000:elwes:/home/elwes:/bin/bash
    mike:x:1001:1001::/home/mike:/bin/bash
    nginx:x:979:977:Nginx web server:/var/lib/nginx:/sbin/nologin
    apache:x:48:48:Apache:/usr/share/httpd:/sbin/nologin
    joana:x:1002:1002:Human Resources:/home/joana:/bin/bash
    bob:x:1003:1003:Without Login:/home/bob:/sbin/nologin

[root@dev1 ~]# id joana
    uid=1002(joana) gid=1002(joana) groups=1002(joana),1004(teste1)

[root@dev1 ~]# userdel -r joana

[root@dev1 ~]# tail /etc/passwd
    rpcuser:x:29:29:RPC Service User:/var/lib/nfs:/sbin/nologin
    sshd:x:74:74:Privilege-separated SSH:/usr/share/empty.sshd:/usr/sbin/nologin
    chrony:x:981:979:chrony system user:/var/lib/chrony:/sbin/nologin
    dnsmasq:x:980:978:Dnsmasq DHCP and DNS server:/var/lib/dnsmasq:/usr/sbin/nologin
    tcpdump:x:72:72::/:/sbin/nologin
    elwes:x:1000:1000:elwes:/home/elwes:/bin/bash
    mike:x:1001:1001::/home/mike:/bin/bash
    nginx:x:979:977:Nginx web server:/var/lib/nginx:/sbin/nologin
    apache:x:48:48:Apache:/usr/share/httpd:/sbin/nologin
    bob:x:1003:1003:Without Login:/home/bob:/sbin/nologin

[root@dev1 ~]# ls /home
    bob  elwes  mike

[root@dev1 ~]# userdel bob

[root@dev1 ~]# ls /home
    bob  elwes  mike

[root@dev1 ~]# tail /etc/passwd
    gnome-initial-setup:x:982:981::/run/gnome-initial-setup/:/sbin/nologin
    rpcuser:x:29:29:RPC Service User:/var/lib/nfs:/sbin/nologin
    sshd:x:74:74:Privilege-separated SSH:/usr/share/empty.sshd:/usr/sbin/nologin
    chrony:x:981:979:chrony system user:/var/lib/chrony:/sbin/nologin
    dnsmasq:x:980:978:Dnsmasq DHCP and DNS server:/var/lib/dnsmasq:/usr/sbin/nologin
    tcpdump:x:72:72::/:/sbin/nologin
    elwes:x:1000:1000:elwes:/home/elwes:/bin/bash
    mike:x:1001:1001::/home/mike:/bin/bash
    nginx:x:979:977:Nginx web server:/var/lib/nginx:/sbin/nologin
    apache:x:48:48:Apache:/usr/share/httpd:/sbin/nologin

[root@dev1 ~]# id elwes
    uid=1000(elwes) gid=1000(elwes) groups=1000(elwes)

[root@dev1 ~]# id root
    uid=0(root) gid=0(root) groups=0(root)

[root@dev1 ~]# useradd -u bia
    useradd: invalid user ID 'bia'
    
[root@dev1 ~]# useradd -u 3000 bia

[root@dev1 ~]# passwd bia
    Changing password for user bia.
    New password:
    BAD PASSWORD: The password is shorter than 8 characters
    Retype new password:
    passwd: all authentication tokens updated successfully.



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
