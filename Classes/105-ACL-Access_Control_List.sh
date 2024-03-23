##############################################################################################################
#### Discovery

[root@dev1 ~]# mkdir /sample
[root@dev1 ~]# groupadd sales
[root@dev1 ~]# chown nobody:sales /sample
# 2 - Set Group Special Permission - SETGID - Any file created within the directory will have the sales group as owner
# 7 - RWX to Nobody
# 7 - RWZ to sales group
# 0 - Others don't have access
[root@dev1 ~]# chmod 2770 /sample
[root@dev1 ~]# ls -ltra / | grep sample
    drwxrws---.   2 nobody sales    6 Mar 18 08:36 sample

[root@dev1 ~]# groupadd rh
[root@dev1 ~]# useradd -G sales tim
[root@dev1 ~]# useradd -G rh angie
[root@dev1 ~]# id tim
    uid=3002(tim) gid=3002(tim) groups=3002(tim),5002(sales)
[root@dev1 ~]# id angie
    uid=3003(angie) gid=3003(angie) groups=3003(angie),5003(rh)
[root@dev1 ~]# su - tim

# /-/-/-/-/-/ tim /-/-/-/-/-/ 
[tim@dev1 ~]$ touch /sample/rh_file
[tim@dev1 ~]$ exit
    logout

# /-/-/-/-/-/ root /-/-/-/-/-/ 
[root@dev1 ~]# su - angie

# /-/-/-/-/-/ angie /-/-/-/-/-/ 
[angie@dev1 ~]$ touch /sample/myfile
    touch: cannot touch '/sample/myfile': Permission denied
[angie@dev1 ~]$ exit
    logout

# /-/-/-/-/-/ root /-/-/-/-/-/ 
[root@dev1 ~]# getfacl /sample
    getfacl: Removing leading '/' from absolute path names
    # file: sample
    # owner: nobody
    # group: sales
    # flags: -s-
    user::rwx
    group::rwx
    other::---

# Read permission to angie on /sample/rh_file will not allow to list the file
# For that execution permission will be required
[root@dev1 ~]# setfacl -m g:rh:r /sample/rh_file
[root@dev1 ~]# su - angie

# /-/-/-/-/-/ angie /-/-/-/-/-/ 
[angie@dev1 ~]$ ls /sample/rh_file
    ls: cannot access '/sample/rh_file': Permission denied
[angie@dev1 ~]$ exit
    logout

# /-/-/-/-/-/ root /-/-/-/-/-/ 
# Add execute permission to /sample
# So, now angie will be able to list /sample/rh_file
[root@dev1 ~]# setfacl -m g:rh:x /sample/
[root@dev1 ~]# su - angie
# /-/-/-/-/-/ angie /-/-/-/-/-/ 
[angie@dev1 ~]$ ls /sample/rh_file
    /sample/rh_file
[angie@dev1 ~]$ exit
    logout

# /-/-/-/-/-/ root /-/-/-/-/-/ 
# Group rh has
# rh:--x on /sample   and
# rh:r-- on /sample/rh_file
[root@dev1 ~]# getfacl /sample/
    getfacl: Removing leading '/' from absolute path names
    # file: sample/
    # owner: nobody
    # group: sales
    # flags: -s-
    user::rwx
    group::rwx
    group:rh:--x
    mask::rwx
    other::---

[root@dev1 ~]# getfacl /sample/rh_file
    getfacl: Removing leading '/' from absolute path names
    # file: sample/rh_file
    # owner: tim
    # group: sales
    user::rw-
    group::r--
    group:rh:r--
    mask::r--
    other::r--








# /-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/
# /-/-/-/-/-/ default acl /-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/
# The default access control list (ACL) is only applied to files generated after the default ACL has been established.
# Files created before, should be updated manually
# Recursiveness may makes this process easier
[root@dev1 ~]# touch /sample/no_acl
[root@dev1 ~]# ls sample
    ls: cannot access 'sample': No such file or directory
[root@dev1 ~]# ls /sample
    no_acl  rh_file
[root@dev1 ~]# setfacl -m d:g:rh:rx /sample
[root@dev1 ~]# getfacl /sample
    getfacl: Removing leading '/' from absolute path names
    # file: sample
    # owner: nobody
    # group: sales
    # flags: -s-
    user::rwx
    group::rwx
    group:rh:--x
    mask::rwx
    other::---
    default:user::rwx
    default:group::rwx
    default:group:rh:r-x
    default:mask::rwx
    default:other::---

[root@dev1 ~]# touch /sample/with_acl
[root@dev1 ~]# getfacl /sample/with_acl
    getfacl: Removing leading '/' from absolute path names
    # file: sample/with_acl
    # owner: root
    # group: sales
    user::rw-
    group::rwx                      #effective:rw-
    group:rh:r-x                    #effective:r--
    mask::rw-
    other::---

[root@dev1 ~]# getfacl /sample/no_acl
    getfacl: Removing leading '/' from absolute path names
    # file: sample/no_acl
    # owner: root
    # group: sales
    user::rw-
    group::r--
    other::r--

[root@dev1 ~]# setfacl -R -m g:rh:rx /sample/
[root@dev1 ~]# getfacl /sample/no_acl
    getfacl: Removing leading '/' from absolute path names
    # file: sample/no_acl
    # owner: root
    # group: sales
    user::rw-
    group::r--
    group:rh:r-x
    mask::r-x
    other::r--

[root@dev1 ~]# su - angie
# /-/-/-/-/-/ angie /-/-/-/-/-/ 
[angie@dev1 ~]$ ls /sample
    no_acl  rh_file  with_acl
[angie@dev1 ~]$ ls /sample/no_acl
    /sample/no_acl
[angie@dev1 ~]$ ls /sample/with_acl
    /sample/with_acl
[angie@dev1 ~]$ exit
    logout
[root@dev1 ~]# getfacl /sample/
    getfacl: Removing leading '/' from absolute path names
    # file: sample/
    # owner: nobody
    # group: sales
    # flags: -s-
    user::rwx
    group::rwx
    group:rh:r-x
    mask::rwx
    other::---
    default:user::rwx
    default:group::rwx
    default:group:rh:r-x
    default:mask::rwx
    default:other::---
# /-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/
# /-/-/-/-/-/  reset acl  /-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/
# Reset ACL on /sample
[root@dev1 ~]# setfacl -b /sample/
[root@dev1 ~]# getfacl /sample/
    getfacl: Removing leading '/' from absolute path names
    # file: sample/
    # owner: nobody
    # group: sales
    # flags: -s-
    user::rwx
    group::rwx
    other::---
# Permissions on files are kept in order to update 
[root@dev1 ~]# getfacl /sample/no_acl
    getfacl: Removing leading '/' from absolute path names
    # file: sample/no_acl
    # owner: root
    # group: sales
    user::rw-
    group::r--
    group:rh:r-x
    mask::r-x
    other::r--

[root@dev1 ~]# setfacl -b -R /sample/
[root@dev1 ~]# getfacl /sample/no_acl
    getfacl: Removing leading '/' from absolute path names
    # file: sample/no_acl
    # owner: root
    # group: sales
    user::rw-
    group::r--
    other::r--

[root@dev1 ~]# su - angie
# /-/-/-/-/-/ angie /-/-/-/-/-/ 
[angie@dev1 ~]$ ls /sample
    ls: cannot open directory '/sample': Permission denied
[angie@dev1 ~]$ exit
    logout

# /-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/
# /-/-/-/-/-/ root /-/-/-/-/-/ 
[root@dev1 ~]# id tim
    uid=3002(tim) gid=3002(tim) groups=3002(tim),5002(sales)
[root@dev1 ~]# id angie
    uid=3003(angie) gid=3003(angie) groups=3003(angie),5003(rh)
[root@dev1 ~]# su - tim

# /-/-/-/-/-/ tim /-/-/-/-/-/ 
[tim@dev1 ~]$ pwd
    /home/tim

[tim@dev1 ~]$ touch to_angie

[tim@dev1 ~]$ su -
    Password:

# /-/-/-/-/-/ root /-/-/-/-/-/ 
[root@dev1 ~]# su - angie

# /-/-/-/-/-/ angie /-/-/-/-/-/ 
[angie@dev1 ~]$ pwd
    /home/angie
[angie@dev1 ~]$ ls /home/tim/to_angie
    ls: cannot access '/home/tim/to_angie': Permission denied

# /-/-/-/-/-/ root /-/-/-/-/-/ 
[angie@dev1 ~]$ su -
    Password:
[root@dev1 ~]# setfacl -m u:angie:r /home/tim/to_angie
[root@dev1 ~]# su - angie
# /-/-/-/-/-/ angie /-/-/-/-/-/ 
[angie@dev1 ~]$ ls /home/tim/to_angie
    ls: cannot access '/home/tim/to_angie': Permission denied
[angie@dev1 ~]$ su -
    Password:

# /-/-/-/-/-/ root /-/-/-/-/-/ 
[root@dev1 ~]# setfacl -m u:angie:x /home/tim/to_angie
[root@dev1 ~]# su - angie

# /-/-/-/-/-/ angie /-/-/-/-/-/ 
[angie@dev1 ~]$ ls /home/tim/to_angie
    ls: cannot access '/home/tim/to_angie': Permission denied
[angie@dev1 ~]$ su -
    Password:

# /-/-/-/-/-/ root /-/-/-/-/-/ 
[root@dev1 ~]# setfacl -m u:angie:x /home/tim/
[root@dev1 ~]# su - angie

# /-/-/-/-/-/ angie /-/-/-/-/-/ 
[angie@dev1 ~]$ ls /home/tim/to_angie
    /home/tim/to_angie

[angie@dev1 ~]$ su -
    Password:

# /-/-/-/-/-/ root /-/-/-/-/-/ 
[root@dev1 ~]# setfacl -x u:angie /home/tim
[root@dev1 ~]# setfacl -x u:angie /home/tim/to_angie
[root@dev1 ~]# getfacl /home/tim
    getfacl: Removing leading '/' from absolute path names
    # file: home/tim
    # owner: tim
    # group: tim
    user::rwx
    group::---
    mask::---
    other::---



































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
