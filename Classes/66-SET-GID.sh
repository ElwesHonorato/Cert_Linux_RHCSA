
##############################################################################################################
#### Discovery
[root@desk ~]# groupadd
    Usage: groupadd [options] GROUP

    Options:
      -f, --force                   exit successfully if the group already exists,
                                    and cancel -g if the GID is already used
      -g, --gid GID                 use GID for the new group
      -h, --help                    display this help message and exit
      -K, --key KEY=VALUE           override /etc/login.defs defaults
      -o, --non-unique              allow to create groups with duplicate
                                    (non-unique) GID
      -p, --password PASSWORD       use this encrypted password for the new group
      -r, --system                  create a system account
      -R, --root CHROOT_DIR         directory to chroot into
      -P, --prefix PREFIX_DI        directory prefix
      -U, --users USERS             list of user members of this group
# Create manager group
# 3000 is an arbitrary number
[root@desk ~]# groupadd -g 3000 manager
# Check if the manager group was created
[root@desk ~]# grep manager /etc/group
    manager:x:3000:   
#
[root@desk ~]#  mkdir -p /home/manager
[root@desk ~]# ls -ld /home/manager
    drwxr-xr-x. 2 root root 6 Mar  5 07:55 /home/manager
# Change ownership of folder /home/manager
# nobody :"nobody" is the conventional name of a user identifier which owns no files, is in no privileged groups, 
#   and has no abilities except those which every other user has. 
#   It is normally not enabled as a user account, i.e. has no home directory or login credentials assigned.
# manager : The group we just created
[root@desk ~]# chown nobody:manager /home/manager
[root@desk ~]# ls -ld /home/manager
    drwxr-xr-x. 2 nobody manager 6 Mar  5 07:55 /home/manager
# Update permissions on /home/manager so the group can write on the directory
[root@desk ~]# chmod g+w /home/manager
[root@desk ~]# ls -ld /home/manager
    drwxrwxr-x. 2 nobody manager 6 Mar  5 07:55 /home/manager
# 
# Remove rw permissions on /home/manager from others(last 3 char of permission )
[root@desk ~]# chmod o-rw /home/manager
[root@desk ~]# ls -ld /home/manager
    drwxrwx--x. 2 nobody manager 6 Mar  5 07:55 /home/manager
# Remove executable permissions on /home/manager from other(last 3 char of permission )
[root@desk ~]# chmod o-x /home/manager
[root@desk ~]# ls -ld /home/manager
    drwxrwx---. 2 nobody manager 6 Mar  5 07:55 /home/manager
# When the setgid permission is set on a directory, files created within that directory will inherit the group ownership of the parent directory 
# rather than the group ownership of the user who created the file. This can be useful for ensuring that files created within a shared directory 
# maintain consistent group ownership.
# s - Was added to the second group of permissions
[root@desk ~]# chmod g+s /home/manager
[root@desk ~]# ls -ld /home/manager
    drwxrws---. 2 nobody manager 6 Mar  5 07:55 /home/manager
# 
# 
[root@desk ~]# adduser
    Usage: adduser [options] LOGIN
           adduser -D
           adduser -D [options]

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
# Create a user called test1 and add it to the manager group
[root@desk ~]# adduser -G manager test1
[root@desk ~]# id test1
    uid=1002(test1) gid=1002(test1) groups=1002(test1),3000(manager)
# 
# 
[root@desk ~]# su - test1
[test1@desk ~]$ cd /home/manager/
# Create a file /home/manager/myfile with user1
[test1@desk manager]$ touch myfile
[test1@desk manager]$ ls -l
    total 0
    -rw-r--r--. 1 test1 manager 0 Mar  5 08:01 myfile

# 
# 
[test1@desk ~]$ exit
    logout
[root@desk ~]# mkdir /home/director
[root@desk ~]# ls -ld /home/director/
    drwxr-xr-x. 2 root root 6 Mar  5 08:03 /home/director/
[root@desk ~]# chown nobody:manager /home/director
[root@desk ~]# ls -ld /home/director/
    drwxr-xr-x. 2 nobody manager 6 Mar  5 08:03 /home/director/
# The first digit, "2", sets the setgid (set group ID) permission. 
#     This means that files created within this directory will inherit the group ownership of the directory, 
#     rather than the primary group of the user who created the file.
# The second and third digits, "7", set read, write, and execute permissions for the owner of the directory.
# The fourth digit, "0", sets no permission for other users.
[root@desk ~]# chmod 2770 /home/director/
[root@desk ~]# ls -ld /home/director/
    drwxrws---. 2 nobody manager 6 Mar  5 08:03 /home/director/
# 
# 
[root@desk ~]# su - test1
[test1@desk ~]$ cd /home/director/
[test1@desk director]$ touch  anotherfile
[test1@desk director]$ ls -ld anotherfile
    -rw-r--r--. 1 test1 manager 0 Mar  5 08:13 anotherfile
[test1@desk manager]$ ls -ld /home/director/
    drwxrws---. 2 nobody manager 6 Mar  5 08:03 /home/director/
[test1@desk manager]$ chmod +t /home/director/
    chmod: changing permissions of '/home/director/': Operation not permitted
# 
# 
[test1@desk manager]$ su -
    Password:
# Add Sticky bit to /home/director/
[root@desk ~]# chmod +t /home/director/
[root@desk ~]# ls -ld /home/director
    drwxrws--T. 2 nobody manager 6 Mar  5 08:03 /home/director
# 
# 
[root@desk ~]# tail /etc/passwd
    gnome-initial-setup:x:982:981::/run/gnome-initial-setup/:/sbin/nologin
    rpcuser:x:29:29:RPC Service User:/var/lib/nfs:/sbin/nologin
    sshd:x:74:74:Privilege-separated SSH:/usr/share/empty.sshd:/usr/sbin/nologin
    chrony:x:981:979:chrony system user:/var/lib/chrony:/sbin/nologin
    dnsmasq:x:980:978:Dnsmasq DHCP and DNS server:/var/lib/dnsmasq:/usr/sbin/nologin
    tcpdump:x:72:72::/:/sbin/nologin
    elwes:x:1000:1000:elwes:/home/elwes:/bin/bash
    user1:x:1001:1001::/home/user1:/bin/bash
    apache:x:48:48:Apache:/usr/share/httpd:/sbin/nologin
    test1:x:1002:1002::/home/test1:/bin/bash
[root@desk ~]# usermod
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
# Append user1 to manager Group
    # -a  append without remove from other groups
    # -G  specify group name
[root@desk ~]# usermod -aG manager user1
[root@desk ~]# id user1
    uid=1001(user1) gid=1001(user1) groups=1001(user1),3000(manager)
# 
# Switch from root user to user1 user
[root@desk ~]# su - user1
[user1@desk ~]$ ls -l /home/manager/
    total 0
    -rw-r--r--. 1 test1 manager 0 Mar  5 08:01 myfile
# Remove file /home/manager/myfile
# File was created by test1 user
# But due to the group permissions on the directory user1 can delete it
    # drwxrws---. 2 nobody manager 6 Mar  5 07:55 /home/manager
# Note that the group has rwx permissions on the directory /home/manager
# user1 is in manager group
[user1@desk ~]$ rm /home/manager/myfile
    rm: remove write-protected regular empty file '/home/manager/myfile'? y
[user1@desk ~]$ ls -l /home/manager/
    total 0
# 
# Try to remove file /home/director/anotherfile
[user1@desk ~]$ ls -ld /home/director/
    drwxrws--T. 2 nobody manager 25 Mar  6 19:23 /home/director/
[user1@desk ~]$ ls -l /home/director/
    total 0
    -rw-r--r--. 1 root manager 0 Mar  6 19:23 anotherfile
# File was created by test1 user
# Due to the group permissions on the directory could do it if not by the sticky bit T
    # drwxrws--T. 2 nobody manager 6 Mar  5 08:03 /home/director
# Only who created the file can delete it
# Note that even with the group having rwx permissions on the directory /home/manager user1 cannot delete it



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
