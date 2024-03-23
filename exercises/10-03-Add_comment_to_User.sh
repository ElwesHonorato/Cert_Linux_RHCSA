# Faça um comentário na conta do usuário tina “RH Temp”

[root@dev1 ~]# useradd -h
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

[root@dev1 ~]# usermod -c "RH Temp" tina
[root@dev1 ~]# tail /etc/passwd
    dnsmasq:x:980:978:Dnsmasq DHCP and DNS server:/var/lib/dnsmasq:/usr/sbin/nologin
    tcpdump:x:72:72::/:/sbin/nologin
    elwes:x:1000:1000:elwes:/home/elwes:/bin/bash
    mike:x:1001:1001::/home/mike:/bin/bash
    nginx:x:979:977:Nginx web server:/var/lib/nginx:/sbin/nologin
    apache:x:48:48:Apache:/usr/share/httpd:/sbin/nologin
    bia:x:2400:3000::/home/bia:/bin/bash
    bob:x:3000:5001::/home/bob:/bin/bash
    tina:x:2700:2700:RH Temp:/home/tina:/bin/bash
    tester:x:3001:3001::/home/tester:/sbin/nologin