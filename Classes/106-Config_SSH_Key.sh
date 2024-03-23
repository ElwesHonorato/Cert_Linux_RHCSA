##############################################################################################################
#### Discovery



[root@srv0 ~]# adduser worker
[root@srv0 ~]# passwd worker
[root@srv0 ~]# su - worker
[worker@srv0 ~]$ ls -a
    .  ..  .bash_logout  .bash_profile  .bashrc  .cache  .mozilla
# 


[root@dev1 ~]# adduser worker
[root@dev1 ~]# su - worker
[worker@dev1 ~]$ ssh-keygen
    Generating public/private rsa key pair.
    Enter file in which to save the key (/home/worker/.ssh/id_rsa):
    Created directory '/home/worker/.ssh'.
    Enter passphrase (empty for no passphrase):
    Enter same passphrase again:
    Your identification has been saved in /home/worker/.ssh/id_rsa
    Your public key has been saved in /home/worker/.ssh/id_rsa.pub
    The key fingerprint is:
    SHA256:FE7cbLGRFh9pCXM3LDigjEPbWznrYz0h7R207sy5ldk worker@dev1.temweb.local
    The key's' randomart image is:
    +---[RSA 3072]----+
    |    .  .++**o+o  |
    |   . = +.oO*=o.. |
    |    + + *o.oo.   |
    |     . + + . .   |
    |      . S o o    |
    |       . + + . + |
    |        + + o + E|
    |       . . = o   |
    |            *.   |
    +----[SHA256]-----+
[worker@dev1 ~]$ ssh-copy-id 192.168.0.10
    /usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/home/worker/.ssh/id_rsa.pub"
    The authenticity of host '192.168.0.10 (192.168.0.10)' can't be established.
    ED25519 key fingerprint is SHA256:SvPXbo8uTv5mfYM3ObiPv8NEC3syVwUolJTcv96i+jk.
    This key is not known by any other names
    Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
    /usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
    /usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
    worker@192.168.0.10's password:

    Number of key(s) added: 1

    Now try logging into the machine, with:   "ssh '192.168.0.10'"
    and check to make sure that only the key(s) you wanted were added.
# 


[worker@srv0 ~]$ ls -a
    .  ..  .bash_logout  .bash_profile  .bashrc  .cache  .mozilla  .ssh
[worker@srv0 ~]$ ls .ssh
    authorized_keys
[worker@srv0 ~]$ cat .ssh/authorized_keys
    ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDcn..............................fasfsfakhlh98JKIONNikjk84re3ifll
# 


[worker@dev1 ~]$ ssh 192.168.0.10
    Last login: Tue Mar 19 07:20:33 2024
[worker@srv0 ~]$ hostname
    srv0.temweb.local
[worker@srv0 ~]$ exit
    logout
    Connection to 192.168.0.10 closed.
[worker@dev1 ~]$ hostname
    dev1.temweb.local
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
