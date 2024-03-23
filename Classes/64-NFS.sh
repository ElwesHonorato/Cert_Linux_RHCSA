##############################################################################################################
#### Mount NFS Remote Directory
# Install nfs-utils

 
[root@dev1 ~]# dnf install -y nfs-utils

[root@dev1 ~]# showmount -e srv0
    Export list for srv0:
    /srv/documentos *
 
[root@dev1 ~]# showmount -e srv0.temweb.local
    Export list for srv0.temweb.local:
    /srv/documentos *

[root@dev1 ~]# mount -t nfs srv0:/srv/documentos /mnt

[root@dev1 ~]# df -h
    Filesystem              Size  Used Avail Use% Mounted on
    devtmpfs                4.0M     0  4.0M   0% /dev
    tmpfs                   876M     0  876M   0% /dev/shm
    tmpfs                   351M  5.4M  346M   2% /run
    /dev/mapper/cs-root     8.6G  4.7G  3.9G  55% /
    /dev/sda1               436M  294M  143M  68% /boot
    tmpfs                   176M   40K  176M   1% /run/user/1000
    /dev/sdb1                89M   14K   82M   1% /fs/ext4
    /dev/mapper/myfs-myxfs  115M  7.1M  108M   7% /fs/xfs
    srv0:/srv/documentos    8.6G  4.6G  4.0G  54% /mnt

[root@dev1 ~]# mount | grep srv0:/srv/documentos
    srv0:/srv/documentos on /mnt type nfs4 (rw,relatime,vers=4.2,rsize=262144,wsize=262144,namlen=255,hard,proto=tcp,timeo=600,retrans=2,sec=sys,clientaddr=192.168.0.100,local_lock=none,addr=192.168.0.10)

[root@dev1 ~]# ls /mnt
    sample_nfs_file

[root@dev1 ~]# df -h
    Filesystem              Size  Used Avail Use% Mounted on
    devtmpfs                4.0M     0  4.0M   0% /dev
    tmpfs                   876M     0  876M   0% /dev/shm
    tmpfs                   351M  5.4M  346M   2% /run
    /dev/mapper/cs-root     8.6G  4.7G  3.9G  55% /
    /dev/sda1               436M  294M  143M  68% /boot
    tmpfs                   176M   40K  176M   1% /run/user/1000
    /dev/sdb1                89M   14K   82M   1% /fs/ext4
    /dev/mapper/myfs-myxfs  115M  7.1M  108M   7% /fs/xfs
    srv0:/srv/documentos    8.6G  4.6G  4.0G  54% /mynfs

[root@dev1 ~]# ls /mynfs
    sample_nfs_file

[root@dev1 ~]# umount /mynfs

[root@dev1 ~]# df -h
    Filesystem              Size  Used Avail Use% Mounted on
    devtmpfs                4.0M     0  4.0M   0% /dev
    tmpfs                   876M     0  876M   0% /dev/shm
    tmpfs                   351M  5.4M  346M   2% /run
    /dev/mapper/cs-root     8.6G  4.7G  3.9G  55% /
    /dev/sda1               436M  294M  143M  68% /boot
    tmpfs                   176M   40K  176M   1% /run/user/1000
    /dev/sdb1                89M   14K   82M   1% /fs/ext4
    /dev/mapper/myfs-myxfs  115M  7.1M  108M   7% /fs/xfs

[root@dev1 ~]# cat /etc/fstab
    #
    # /etc/fstab
    # Created by anaconda on Fri Feb 23 23:54:04 2024
    #
    # Accessible filesystems, by reference, are maintained under '/dev/disk/'.
    # See man pages fstab(5), findfs(8), mount(8) and/or blkid(8) for more info.
    #
    # After editing this file, run 'systemctl daemon-reload' to update systemd
    # units generated from this file.
    #
    /dev/mapper/cs-root     /                       xfs     defaults        0 0
    UUID=c07b4e4a-9aa8-4f51-a653-d0fb026dd2fc /boot                   xfs     defaults        0 0
    /dev/mapper/cs-swap     none                    swap    defaults        0 0
    LABEL=myext4    /fs/ext4        ext4    defaults        0       0
    /dev/myfs/myxfs /fs/xfs xfs     defaults        0       0

[root@dev1 ~]# vi /etc/fstab
    #
    # /etc/fstab
    # Created by anaconda on Fri Feb 23 23:54:04 2024
    #
    # Accessible filesystems, by reference, are maintained under '/dev/disk/'.
    # See man pages fstab(5), findfs(8), mount(8) and/or blkid(8) for more info.
    #
    # After editing this file, run 'systemctl daemon-reload' to update systemd
    # units generated from this file.
    #
    /dev/mapper/cs-root     /                       xfs     defaults        0 0
    UUID=c07b4e4a-9aa8-4f51-a653-d0fb026dd2fc /boot                   xfs     defaults        0 0
    /dev/mapper/cs-swap     none                    swap    defaults        0 0
    LABEL=myext4    /fs/ext4        ext4    defaults        0       0
    /dev/myfs/myxfs /fs/xfs xfs     defaults        0       0
    srv0.temweb.local:/srv/documentos        /mynfs  nfs     _netdev 0       0   

[root@dev1 ~]# mount -a
    mount: (hint) your fstab has been modified, but systemd still uses
           the old version; use 'systemctl daemon-reload' to reload.

[root@dev1 ~]# df -h
    Filesystem                         Size  Used Avail Use% Mounted on
    devtmpfs                           4.0M     0  4.0M   0% /dev
    tmpfs                              876M     0  876M   0% /dev/shm
    tmpfs                              351M  5.4M  346M   2% /run
    /dev/mapper/cs-root                8.6G  4.7G  3.9G  55% /
    /dev/sda1                          436M  294M  143M  68% /boot
    tmpfs                              176M   40K  176M   1% /run/user/1000
    /dev/sdb1                           89M   14K   82M   1% /fs/ext4
    /dev/mapper/myfs-myxfs             115M  7.1M  108M   7% /fs/xfs
    srv0.temweb.local:/srv/documentos  8.6G  4.6G  4.0G  54% /mynfs
[root@dev1 ~]# ls /mynfs/
    sample_nfs_file

[root@dev1 ~]# reboot

[root@dev1 ~]# df -h
    Filesystem                         Size  Used Avail Use% Mounted on
    devtmpfs                           4.0M     0  4.0M   0% /dev
    tmpfs                              876M     0  876M   0% /dev/shm
    tmpfs                              351M  5.4M  346M   2% /run
    /dev/mapper/cs-root                8.6G  4.8G  3.9G  56% /
    /dev/sda1                          436M  294M  143M  68% /boot
    /dev/mapper/myfs-myxfs             115M  7.1M  108M   7% /fs/xfs
    /dev/sdb1                           89M   14K   82M   1% /fs/ext4
    srv0.temweb.local:/srv/documentos  8.6G  4.6G  4.0G  54% /mynfs
    tmpfs                              176M   40K  176M   1% /run/user/1000
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
