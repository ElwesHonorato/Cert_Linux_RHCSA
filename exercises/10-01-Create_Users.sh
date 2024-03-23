# Crie 2 usuários: bob e tina. bob tem UID de 3000, e tina tem UID de 2700.
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

[root@dev1 ~]# useradd -u 3000 bob
[root@dev1 ~]# useradd -u 2700 tina