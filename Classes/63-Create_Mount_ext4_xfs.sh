##############################################################################################################
#### Discovery 
[root@dev1 ~]# lsblk
    NAME        MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
    sda           8:0    0   10G  0 disk
    ├─sda1        8:1    0  500M  0 part /boot
    └─sda2        8:2    0  9.5G  0 part
      ├─cs-root 253:0    0  8.6G  0 lvm  /
      └─cs-swap 253:1    0  956M  0 lvm  [SWAP]
    sdb           8:16   0    1G  0 disk
    sdc           8:32   0    1G  0 disk
    sdd           8:48   0    1G  0 disk
    sr0          11:0    1 1024M  0 rom
[root@dev1 ~]# mkdir -p /fs/ext4 /fs/xfs
[root@dev1 ~]# ls /fs
    ext4  xfs 
[root@dev1 ~]# fdisk /dev/sdb

    Welcome to fdisk (util-linux 2.37.4).
    Changes will remain in memory only, until you decide to write them.
    Be careful before using the write command.

    Device does not contain a recognized partition table.
    Created a new DOS disklabel with disk identifier 0x004e3a07.

    Command (m for help): p
    Disk /dev/sdb: 1 GiB, 1073741824 bytes, 2097152 sectors
    Disk model: VBOX HARDDISK
    Units: sectors of 1 * 512 = 512 bytes
    Sector size (logical/physical): 512 bytes / 512 bytes
    I/O size (minimum/optimal): 512 bytes / 512 bytes
    Disklabel type: dos
    Disk identifier: 0x004e3a07

    Command (m for help): n
        Partition type
        p   primary (0 primary, 0 extended, 4 free)
        e   extended (container for logical partitions)
        Select (default p): p
        Partition number (1-4, default 1):
        First sector (2048-2097151, default 2048):
        Last sector, +/-sectors or +/-size{K,M,G,T,P} (2048-2097151, default 2097151): +100M

        Created a new partition 1 of type 'Linux' and of size 100 MiB.

    Command (m for help): n
        Partition type
        p   primary (1 primary, 0 extended, 3 free)
        e   extended (container for logical partitions)
        Select (default p): p
        Partition number (2-4, default 2): 2
        First sector (206848-2097151, default 206848):
        Last sector, +/-sectors or +/-size{K,M,G,T,P} (206848-2097151, default 2097151): +200M

        Created a new partition 2 of type 'Linux' and of size 200 MiB.

    Command (m for help): l

        00 Empty            24 NEC DOS          81 Minix / old Lin  bf Solaris
        01 FAT12            27 Hidden NTFS Win  82 Linux swap / So  c1 DRDOS/sec (FAT-
        02 XENIX root       39 Plan 9           83 Linux            c4 DRDOS/sec (FAT-
        03 XENIX usr        3c PartitionMagic   84 OS/2 hidden or   c6 DRDOS/sec (FAT-
        04 FAT16 <32M       40 Venix 80286      85 Linux extended   c7 Syrinx
        05 Extended         41 PPC PReP Boot    86 NTFS volume set  da Non-FS data
        06 FAT16            42 SFS              87 NTFS volume set  db CP/M / CTOS / .
        07 HPFS/NTFS/exFAT  4d QNX4.x           88 Linux plaintext  de Dell Utility
        08 AIX              4e QNX4.x 2nd part  8e Linux LVM        df BootIt
        09 AIX bootable     4f QNX4.x 3rd part  93 Amoeba           e1 DOS access
        0a OS/2 Boot Manag  50 OnTrack DM       94 Amoeba BBT       e3 DOS R/O
        0b W95 FAT32        51 OnTrack DM6 Aux  9f BSD/OS           e4 SpeedStor
        0c W95 FAT32 (LBA)  52 CP/M             a0 IBM Thinkpad hi  ea Linux extended
        0e W95 FAT16 (LBA)  53 OnTrack DM6 Aux  a5 FreeBSD          eb BeOS fs
        0f W95 Ext''d (LBA)  54 OnTrackDM6       a6 OpenBSD          ee GPT
        10 OPUS             55 EZ-Drive         a7 NeXTSTEP         ef EFI (FAT-12/16/
        11 Hidden FAT12     56 Golden Bow       a8 Darwin UFS       f0 Linux/PA-RISC b
        12 Compaq diagnost  5c Priam Edisk      a9 NetBSD           f1 SpeedStor
        14 Hidden FAT16 <3  61 SpeedStor        ab Darwin boot      f4 SpeedStor
        16 Hidden FAT16     63 GNU HURD or Sys  af HFS / HFS+       f2 DOS secondary
        17 Hidden HPFS/NTF  64 Novell Netware   b7 BSDI fs          fb VMware VMFS
        18 AST SmartSleep   65 Novell Netware   b8 BSDI swap        fc VMware VMKCORE
        1b Hidden W95 FAT3  70 DiskSecure Mult  bb Boot Wizard hid  fd Linux raid auto
        1c Hidden W95 FAT3  75 PC/IX            bc Acronis FAT32 L  fe LANstep
        1e Hidden W95 FAT1  80 Old Minix        be Solaris boot     ff BBT

        Aliases:
        linux          - 83
        swap           - 82
        extended       - 05
        uefi           - EF
        raid           - FD
        lvm            - 8E
        linuxex        - 85

    Command (m for help): t
        Partition number (1,2, default 2): 2
        Hex code or alias (type L to list all): 8e

        Changed type of partition 'Linux' to 'Linux LVM'.

    Command (m for help): p
        Disk /dev/sdb: 1 GiB, 1073741824 bytes, 2097152 sectors
        Disk model: VBOX HARDDISK
        Units: sectors of 1 * 512 = 512 bytes
        Sector size (logical/physical): 512 bytes / 512 bytes
        I/O size (minimum/optimal): 512 bytes / 512 bytes
        Disklabel type: dos
        Disk identifier: 0x004e3a07

        Device     Boot  Start    End Sectors  Size Id Type
        /dev/sdb1         2048 206847  204800  100M 83 Linux
        /dev/sdb2       206848 616447  409600  200M 8e Linux LVM

    Command (m for help): n
        Partition type
        p   primary (2 primary, 0 extended, 2 free)
        e   extended (container for logical partitions)
        Select (default p): p
        Partition number (3,4, default 3): 3
        First sector (616448-2097151, default 616448):
        Last sector, +/-sectors or +/-size{K,M,G,T,P} (616448-2097151, default 2097151): +200M

        Created a new partition 3 of type 'Linux' and of size 200 MiB.

    Command (m for help): t
        Partition number (1-3, default 3): 3
        Hex code or alias (type L to list all): 8e

        Changed type of partition 'Linux' to 'Linux LVM'.

    Command (m for help): p
        Disk /dev/sdb: 1 GiB, 1073741824 bytes, 2097152 sectors
        Disk model: VBOX HARDDISK
        Units: sectors of 1 * 512 = 512 bytes
        Sector size (logical/physical): 512 bytes / 512 bytes
        I/O size (minimum/optimal): 512 bytes / 512 bytes
        Disklabel type: dos
        Disk identifier: 0x004e3a07

        Device     Boot  Start     End Sectors  Size Id Type
        /dev/sdb1         2048  206847  204800  100M 83 Linux
        /dev/sdb2       206848  616447  409600  200M 8e Linux LVM
        /dev/sdb3       616448 1026047  409600  200M 8e Linux LVM

    Command (m for help): w
        The partition table has been altered.
        Calling ioctl() to re-read partition table.
        Syncing disks.

[root@dev1 ~]# partprobe
[root@dev1 ~]# lsblk
    NAME        MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
    sda           8:0    0   10G  0 disk
    ├─sda1        8:1    0  500M  0 part /boot
    └─sda2        8:2    0  9.5G  0 part
      ├─cs-root 253:0    0  8.6G  0 lvm  /
      └─cs-swap 253:1    0  956M  0 lvm  [SWAP]
    sdb           8:16   0    1G  0 disk
    ├─sdb1        8:17   0  100M  0 part
    ├─sdb2        8:18   0  200M  0 part
    └─sdb3        8:19   0  200M  0 part
    sdc           8:32   0    1G  0 disk
    sdd           8:48   0    1G  0 disk
    sr0          11:0    1 1024M  0 rom
[root@dev1 ~]# fdisk -l /dev/sdb
    Disk /dev/sdb: 1 GiB, 1073741824 bytes, 2097152 sectors
    Disk model: VBOX HARDDISK
    Units: sectors of 1 * 512 = 512 bytes
    Sector size (logical/physical): 512 bytes / 512 bytes
    I/O size (minimum/optimal): 512 bytes / 512 bytes
    Disklabel type: dos
    Disk identifier: 0x004e3a07

    Device     Boot  Start     End Sectors  Size Id Type
    /dev/sdb1         2048  206847  204800  100M 83 Linux
    /dev/sdb2       206848  616447  409600  200M 8e Linux LVM
    /dev/sdb3       616448 1026047  409600  200M 8e Linux LVM
[root@dev1 ~]# mkfs.
    mkfs.cramfs  mkfs.ext3    mkfs.fat     mkfs.msdos   mkfs.xfs
    mkfs.ext2    mkfs.ext4    mkfs.minix   mkfs.vfat
[root@dev1 ~]# mkfs.ext4 -L myext4 /dev/sdb1
    mke2fs 1.46.5 (30-Dec-2021)
    Creating filesystem with 102400 1k blocks and 25584 inodes
    Filesystem UUID: 29e9f39e-4920-451a-8aae-2108cff6e649
    Superblock backups stored on blocks:
            8193, 24577, 40961, 57345, 73729

    Allocating group tables: done
    Writing inode tables: done
    Creating journal (4096 blocks): done
    Writing superblocks and filesystem accounting information: done

[root@dev1 ~]#
[root@dev1 ~]# lsblk -fi
    NAME     FSTYPE      FSVER    LABEL  UUID                                   FSAVAIL FSUSE% MOUNTPOINTS
    sda
    |-sda1   xfs                         c07b4e4a-9aa8-4f51-a653-d0fb026dd2fc    142.9M    67% /boot
    `-sda2   LVM2_member LVM2 001        01r8N3-pKgY-bHbi-xVRa-n838-Ktei-7mbyqj
      |-cs-root
      |      xfs                         7b2c3470-0adc-4323-86bf-24c20411df68      3.9G    54% /
      ``-cs-swap
             swap        1               870fa721-5a7a-4289-9658-a03e88ae5a28                  [SWAP]
    sdb
    |-sdb1   ext4        1.0      myext4 29e9f39e-4920-451a-8aae-2108cff6e649
    |-sdb2
    `-sdb3
    sdc
    sdd
    sr0
[root@dev1 ~]# mount /dev/sdb1 /fs/ext4/
[root@dev1 ~]# ls /fs/ext4/
    lost+found
[root@dev1 ~]# pvcreate /dev/sdb2 /dev/sdb3
  Physical volume "/dev/sdb2" successfully created.
  Physical volume "/dev/sdb3" successfully created.
[root@dev1 ~]# vgs
  VG #PV #LV #SN Attr   VSize  VFree
  cs   1   2   0 wz--n- <9.51g    0
[root@dev1 ~]# vgcreate myfs /dev/sdb2 /dev/sdb3
  Volume group "myfs" successfully created
[root@dev1 ~]# vgs
  VG   #PV #LV #SN Attr   VSize   VFree
  cs     1   2   0 wz--n-  <9.51g      0
  myfs   2   0   0 wz--n- 392.00m 392.00m
[root@dev1 ~]# vgdisplay myfs
  --- Volume group ---
  VG Name               myfs
  System ID
  Format                lvm2
  Metadata Areas        2
  Metadata Sequence No  1
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                0
  Open LV               0
  Max PV                0
  Cur PV                2
  Act PV                2
  VG Size               392.00 MiB
  PE Size               4.00 MiB
  Total PE              98
  Alloc PE / Size       0 / 0
  Free  PE / Size       98 / 392.00 MiB
  VG UUID               JK0c8b-b1M5-QvOn-o0Tc-qeO2-OYuL-xXgKHM

[root@dev1 ~]# lvcreate -l 30 -n myxfs myfs
  Logical volume "myxfs" created.
[root@dev1 ~]# lvs
  LV    VG   Attr       LSize   Pool Origin Data%  Meta%  Move Log Cpy%Sync Convert
  root  cs   -wi-ao----   8.57g
  swap  cs   -wi-ao---- 956.00m
  myxfs myfs -wi-a----- 120.00m
[root@dev1 ~]#  vgdisplay myfs
  --- Volume group ---
  VG Name               myfs
  System ID
  Format                lvm2
  Metadata Areas        2
  Metadata Sequence No  2
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                1
  Open LV               0
  Max PV                0
  Cur PV                2
  Act PV                2
  VG Size               392.00 MiB
  PE Size               4.00 MiB
  Total PE              98
  Alloc PE / Size       30 / 120.00 MiB
  Free  PE / Size       68 / 272.00 MiB
  VG UUID               JK0c8b-b1M5-QvOn-o0Tc-qeO2-OYuL-xXgKHM

[root@dev1 ~]# lsblk
    NAME           MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
    sda              8:0    0   10G  0 disk
    ├─sda1           8:1    0  500M  0 part /boot
    └─sda2           8:2    0  9.5G  0 part
      ├─cs-root    253:0    0  8.6G  0 lvm  /
      └─cs-swap    253:1    0  956M  0 lvm  [SWAP]
    sdb              8:16   0    1G  0 disk
    ├─sdb1           8:17   0  100M  0 part /fs/ext4
    ├─sdb2           8:18   0  200M  0 part
    │ └─myfs-myxfs 253:2    0  120M  0 lvm
    └─sdb3           8:19   0  200M  0 part
    sdc              8:32   0    1G  0 disk
    sdd              8:48   0    1G  0 disk
    sr0             11:0    1 1024M  0 rom
[root@dev1 ~]# lvs
  LV    VG   Attr       LSize   Pool Origin Data%  Meta%  Move Log Cpy%Sync Convert
  root  cs   -wi-ao----   8.57g
  swap  cs   -wi-ao---- 956.00m
  myxfs myfs -wi-a----- 120.00m
[root@dev1 ~]# lvremove myfs
    Do you really want to remove active logical volume myfs/myxfs? [y/n]: y
      Logical volume "myxfs" successfully removed.
[root@dev1 ~]# lvcreate -l 30 -n myxfs myfs
  Logical volume "myxfs" created.
[root@dev1 ~]# lvs
  LV    VG   Attr       LSize   Pool Origin Data%  Meta%  Move Log Cpy%Sync Convert
  root  cs   -wi-ao----   8.57g
  swap  cs   -wi-ao---- 956.00m
  myxfs myfs -wi-a----- 120.00m
[root@dev1 ~]# lsblk
    NAME           MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
    sda              8:0    0   10G  0 disk
    ├─sda1           8:1    0  500M  0 part /boot
    └─sda2           8:2    0  9.5G  0 part
      ├─cs-root    253:0    0  8.6G  0 lvm  /
      └─cs-swap    253:1    0  956M  0 lvm  [SWAP]
    sdb              8:16   0    1G  0 disk
    ├─sdb1           8:17   0  100M  0 part /fs/ext4
    ├─sdb2           8:18   0  200M  0 part
    │ └─myfs-myxfs 253:2    0  120M  0 lvm
    └─sdb3           8:19   0  200M  0 part
    sdc              8:32   0    1G  0 disk
    sdd              8:48   0    1G  0 disk
    sr0             11:0    1 1024M  0 rom
[root@dev1 ~]# mount /dev/myfs/myxfs /fs/xfs
[root@dev1 ~]# lsblk
    NAME           MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
    sda              8:0    0   10G  0 disk
    ├─sda1           8:1    0  500M  0 part /boot
    └─sda2           8:2    0  9.5G  0 part
      ├─cs-root    253:0    0  8.6G  0 lvm  /
      └─cs-swap    253:1    0  956M  0 lvm  [SWAP]
    sdb              8:16   0    1G  0 disk
    ├─sdb1           8:17   0  100M  0 part /fs/ext4
    ├─sdb2           8:18   0  200M  0 part
    │ └─myfs-myxfs 253:2    0  120M  0 lvm  /fs/xfs
    └─sdb3           8:19   0  200M  0 part
    sdc              8:32   0    1G  0 disk
    sdd              8:48   0    1G  0 disk
    sr0             11:0    1 1024M  0 rom
[root@dev1 ~]# mount
    proc on /proc type proc (rw,nosuid,nodev,noexec,relatime)
    sysfs on /sys type sysfs (rw,nosuid,nodev,noexec,relatime,seclabel)
    devtmpfs on /dev type devtmpfs (rw,nosuid,seclabel,size=4096k,nr_inodes=216273,mode=755,inode64)
    securityfs on /sys/kernel/security type securityfs (rw,nosuid,nodev,noexec,relatime)
    tmpfs on /dev/shm type tmpfs (rw,nosuid,nodev,seclabel,inode64)
    devpts on /dev/pts type devpts (rw,nosuid,noexec,relatime,seclabel,gid=5,mode=620,ptmxmode=000)
    tmpfs on /run type tmpfs (rw,nosuid,nodev,seclabel,size=358756k,nr_inodes=819200,mode=755,inode64)
    cgroup2 on /sys/fs/cgroup type cgroup2 (rw,nosuid,nodev,noexec,relatime,seclabel,nsdelegate,memory_recursiveprot)
    pstore on /sys/fs/pstore type pstore (rw,nosuid,nodev,noexec,relatime,seclabel)
    bpf on /sys/fs/bpf type bpf (rw,nosuid,nodev,noexec,relatime,mode=700)
    /dev/mapper/cs-root on / type xfs (rw,relatime,seclabel,attr2,inode64,logbufs=8,logbsize=32k,noquota)
    selinuxfs on /sys/fs/selinux type selinuxfs (rw,nosuid,noexec,relatime)
    systemd-1 on /proc/sys/fs/binfmt_misc type autofs (rw,relatime,fd=29,pgrp=1,timeout=0,minproto=5,maxproto=5,direct,pipe_ino=18982)
    hugetlbfs on /dev/hugepages type hugetlbfs (rw,relatime,seclabel,pagesize=2M)
    mqueue on /dev/mqueue type mqueue (rw,nosuid,nodev,noexec,relatime,seclabel)
    debugfs on /sys/kernel/debug type debugfs (rw,nosuid,nodev,noexec,relatime,seclabel)
    tracefs on /sys/kernel/tracing type tracefs (rw,nosuid,nodev,noexec,relatime,seclabel)
    fusectl on /sys/fs/fuse/connections type fusectl (rw,nosuid,nodev,noexec,relatime)
    none on /run/credentials/systemd-sysctl.service type ramfs (ro,nosuid,nodev,noexec,relatime,seclabel,mode=700)
    configfs on /sys/kernel/config type configfs (rw,nosuid,nodev,noexec,relatime)
    none on /run/credentials/systemd-tmpfiles-setup-dev.service type ramfs (ro,nosuid,nodev,noexec,relatime,seclabel,mode=700)
    /dev/sda1 on /boot type xfs (rw,relatime,seclabel,attr2,inode64,logbufs=8,logbsize=32k,noquota)
    none on /run/credentials/systemd-tmpfiles-setup.service type ramfs (ro,nosuid,nodev,noexec,relatime,seclabel,mode=700)
    sunrpc on /var/lib/nfs/rpc_pipefs type rpc_pipefs (rw,relatime)
    tmpfs on /run/user/1000 type tmpfs (rw,nosuid,nodev,relatime,seclabel,size=179376k,nr_inodes=44844,mode=700,uid=1000,gid=1000,inode64)
    /dev/sdb1 on /fs/ext4 type ext4 (rw,relatime,seclabel)
    /dev/mapper/myfs-myxfs on /fs/xfs type xfs (rw,relatime,seclabel,attr2,inode64,logbufs=8,logbsize=32k,noquota)

# 
[root@dev1 ~]# reboot
#
# Partitions no added to /etc/fstab are unmounted on Reboot
[root@dev1 ~]# lsblk
    NAME           MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
    sda              8:0    0   10G  0 disk
    ├─sda1           8:1    0  500M  0 part /boot
    └─sda2           8:2    0  9.5G  0 part
      ├─cs-root    253:0    0  8.6G  0 lvm  /
      └─cs-swap    253:1    0  956M  0 lvm  [SWAP]
    sdb              8:16   0    1G  0 disk
    ├─sdb1           8:17   0  100M  0 part
    ├─sdb2           8:18   0  200M  0 part
    │ └─myfs-myxfs 253:2    0  120M  0 lvm
    └─sdb3           8:19   0  200M  0 part
    sdc              8:32   0    1G  0 disk
    sdd              8:48   0    1G  0 disk
    sr0             11:0    1 1024M  0 rom
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

[root@dev1 ~]# lsblk -fi
    NAME        FSTYPE   FSVER    LABEL  UUID                                   FSAVAIL FSUSE% MOUNTPOINTS
    sda
    |-sda1      xfs                      c07b4e4a-9aa8-4f51-a653-d0fb026dd2fc    142.9M    67% /boot
    `-sda2      LVM2_mem LVM2 001        01r8N3-pKgY-bHbi-xVRa-n838-Ktei-7mbyqj
      |-cs-root xfs                      7b2c3470-0adc-4323-86bf-24c20411df68      3.9G    54% /
      `-cs-swap swap     1               870fa721-5a7a-4289-9658-a03e88ae5a28                  [SWAP]
    sdb
    |-sdb1      ext4     1.0      myext4 29e9f39e-4920-451a-8aae-2108cff6e649
    |-sdb2      LVM2_mem LVM2 001        CiQjuC-7dz3-uBeW-grKV-aM2d-deq8-3k58Gt
    | `-myfs-myxfs
    |           xfs                      1e9fd0d8-df4c-4d23-8d0a-f66b0d16e41e
    `-sdb3      LVM2_mem LVM2 001        M5JDbw-PB8m-vF0T-S9a6-gycp-Tkls-UItzT1
    sdc
    sdd
    sr0

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

[root@dev1 ~]# mount -a
    mount: (hint) your fstab has been modified, but systemd still uses
           the old version; use 'systemctl daemon-reload' to reload.
[root@dev1 ~]# lsblk -fi
    NAME        FSTYPE   FSVER    LABEL  UUID                                   FSAVAIL FSUSE% MOUNTPOINTS
    sda
    |-sda1      xfs                      c07b4e4a-9aa8-4f51-a653-d0fb026dd2fc    142.9M    67% /boot
    `-sda2      LVM2_mem LVM2 001        01r8N3-pKgY-bHbi-xVRa-n838-Ktei-7mbyqj
      |-cs-root xfs                      7b2c3470-0adc-4323-86bf-24c20411df68      3.9G    54% /
      `-cs-swap swap     1               870fa721-5a7a-4289-9658-a03e88ae5a28                  [SWAP]
    sdb
    |-sdb1      ext4     1.0      myext4 29e9f39e-4920-451a-8aae-2108cff6e649     81.2M     0% /fs/ext4
    |-sdb2      LVM2_mem LVM2 001        CiQjuC-7dz3-uBeW-grKV-aM2d-deq8-3k58Gt
    | `-myfs-myxfs
    |           xfs                      1e9fd0d8-df4c-4d23-8d0a-f66b0d16e41e    107.6M     6% /fs/xfs
    `-sdb3      LVM2_mem LVM2 001        M5JDbw-PB8m-vF0T-S9a6-gycp-Tkls-UItzT1
    sdc
    sdd
  sr0
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
