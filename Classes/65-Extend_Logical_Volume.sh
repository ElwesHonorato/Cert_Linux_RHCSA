##############################################################################################################
#### Extend existent logical volumes
### Create Partitions
[root@desk ~]# df -h
    Filesystem                    Size  Used Avail Use% Mounted on
    devtmpfs                      4.0M     0  4.0M   0% /dev
    tmpfs                         876M     0  876M   0% /dev/shm
    tmpfs                         351M  1.4M  349M   1% /run
    /dev/mapper/cs-root           8.6G  4.9G  3.7G  58% /
    /dev/sda1                     436M  294M  143M  68% /boot
    /dev/sdc1                      95M  6.0M   89M   7% /examplesfs/labels/xfs
    /dev/mapper/example_vg-mylv1   95M  6.0M   89M   7% /examplesfs/xfs
    /dev/sdc2                      89M   14K   82M   1% /examplesfs/labels/ext4
    /dev/mapper/example_vg-mylv2  182M   14K  168M   1% /examplesfs/ext4
    tmpfs                         176M   60K  176M   1% /run/user/42
    tmpfs                         176M   40K  176M   1% /run/user/1000
[root@desk ~]# lsblk
    NAME                 MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
    sda                    8:0    0   10G  0 disk
    ├─sda1                 8:1    0  500M  0 part /boot
    └─sda2                 8:2    0  9.5G  0 part
      ├─cs-root          253:0    0  8.6G  0 lvm  /
      └─cs-swap          253:1    0  956M  0 lvm  [SWAP]
    sdb                    8:16   0    1G  0 disk
    ├─sdb1                 8:17   0  100M  0 part
    ├─sdb2                 8:18   0  200M  0 part
    │ ├─example_vg-mylv1 253:3    0  100M  0 lvm  /examplesfs/xfs
    │ └─example_vg-mylv2 253:4    0  200M  0 lvm  /examplesfs/ext4
    ├─sdb4                 8:20   0    1K  0 part
    └─sdb5                 8:21   0  200M  0 part
      └─example_vg-mylv2 253:4    0  200M  0 lvm  /examplesfs/ext4
    sdc                    8:32   0    1G  0 disk
    ├─sdc1                 8:33   0  100M  0 part /examplesfs/labels/xfs
    └─sdc2                 8:34   0  100M  0 part /examplesfs/labels/ext4
    sdd                    8:48   0    1G  0 disk
    ├─sdd1                 8:49   0  200M  0 part [SWAP]
    └─sdd2                 8:50   0  200M  0 part
      └─MYSWAP-mymemswap 253:2    0  196M  0 lvm  [SWAP]
    sr0                   11:0    1 1024M  0 rom
[root@desk ~]# gdisk -l /dev/sdc
    GPT fdisk (gdisk) version 1.0.7

    Partition table scan:
      MBR: protective
      BSD: not present
      APM: not present
      GPT: present

    Found valid GPT with protective MBR; using GPT.
    Disk /dev/sdc: 2097152 sectors, 1024.0 MiB
    Model: VBOX HARDDISK
    Sector size (logical/physical): 512/512 bytes
    Disk identifier (GUID): F2E34693-6192-4CD5-8F23-F2D56C2B16CB
    Partition table holds up to 128 entries
    Main partition table begins at sector 2 and ends at sector 33
    First usable sector is 34, last usable sector is 2097118
    Partitions will be aligned on 2048-sector boundaries
    Total free space is 1687485 sectors (824.0 MiB)

    Number  Start (sector)    End (sector)  Size       Code  Name
       1            2048          206847   100.0 MiB   8300  Linux filesystem
       2          206848          411647   100.0 MiB   8300  Linux filesystem
[root@desk ~]# gdisk /dev/sdc
    GPT fdisk (gdisk) version 1.0.7

    Partition table scan:
      MBR: protective
      BSD: not present
      APM: not present
      GPT: present

    Found valid GPT with protective MBR; using GPT.

    Command (? for help): p
    Disk /dev/sdc: 2097152 sectors, 1024.0 MiB
    Model: VBOX HARDDISK
    Sector size (logical/physical): 512/512 bytes
    Disk identifier (GUID): F2E34693-6192-4CD5-8F23-F2D56C2B16CB
    Partition table holds up to 128 entries
    Main partition table begins at sector 2 and ends at sector 33
    First usable sector is 34, last usable sector is 2097118
    Partitions will be aligned on 2048-sector boundaries
    Total free space is 1687485 sectors (824.0 MiB)

    Number  Start (sector)    End (sector)  Size       Code  Name
       1            2048          206847   100.0 MiB   8300  Linux filesystem
       2          206848          411647   100.0 MiB   8300  Linux filesystem

    Command (? for help): n
    Partition number (3-128, default 3):
    First sector (34-2097118, default = 411648) or {+-}size{KMGTP}:
    Last sector (411648-2097118, default = 2097118) or {+-}size{KMGTP}:
    Current type is 8300 (Linux filesystem)
    Hex code or GUID (L to show codes, Enter = 8300):
    Changed type of partition to 'Linux filesystem'

    Command (? for help): p
    Disk /dev/sdc: 2097152 sectors, 1024.0 MiB
    Model: VBOX HARDDISK
    Sector size (logical/physical): 512/512 bytes
    Disk identifier (GUID): F2E34693-6192-4CD5-8F23-F2D56C2B16CB
    Partition table holds up to 128 entries
    Main partition table begins at sector 2 and ends at sector 33
    First usable sector is 34, last usable sector is 2097118
    Partitions will be aligned on 2048-sector boundaries
    Total free space is 2014 sectors (1007.0 KiB)

    Number  Start (sector)    End (sector)  Size       Code  Name
       1            2048          206847   100.0 MiB   8300  Linux filesystem
       2          206848          411647   100.0 MiB   8300  Linux filesystem
       3          411648         2097118   823.0 MiB   8300  Linux filesystem

    Command (? for help): t
    Partition number (1-3): 8e00
    Value out of range
    Partition number (1-3):
    Partition number (1-3): 3
    Current type is 8300 (Linux filesystem)
    Hex code or GUID (L to show codes, Enter = 8300): 8e00
    Changed type of partition to 'Linux LVM'

    Command (? for help): p
    Disk /dev/sdc: 2097152 sectors, 1024.0 MiB
    Model: VBOX HARDDISK
    Sector size (logical/physical): 512/512 bytes
    Disk identifier (GUID): F2E34693-6192-4CD5-8F23-F2D56C2B16CB
    Partition table holds up to 128 entries
    Main partition table begins at sector 2 and ends at sector 33
    First usable sector is 34, last usable sector is 2097118
    Partitions will be aligned on 2048-sector boundaries
    Total free space is 2014 sectors (1007.0 KiB)

    Number  Start (sector)    End (sector)  Size       Code  Name
       1            2048          206847   100.0 MiB   8300  Linux filesystem
       2          206848          411647   100.0 MiB   8300  Linux filesystem
       3          411648         2097118   823.0 MiB   8E00  Linux LVM

    Command (? for help): y
    b       back up GPT data to a file
    c       change a partition's name
    d       delete a partition
    i       show detailed information on a partition
    l       list known partition types
    n       add a new partition
    o       create a new empty GUID partition table (GPT)
    p       print the partition table
    q       quit without saving changes
    r       recovery and transformation options (experts only)
    s       sort partitions
    t       change a partition's type code
    v       verify disk
    w       write table to disk and exit
    x       extra functionality (experts only)
    ?       print this menu

    Command (? for help): w

    Final checks complete. About to write GPT data. THIS WILL OVERWRITE EXISTING
    PARTITIONS!!

    Do you want to proceed? (Y/N): y
    OK; writing new GUID partition table (GPT) to /dev/sdc.
    Warning: The kernel is still using the old partition table.
    The new table will be used at the next reboot or after you
    run partprobe(8) or kpartx(8)
    The operation has completed successfully.
    [root@desk ~]# partprobe
    [root@desk ~]# lsblk
    NAME                 MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
    sda                    8:0    0   10G  0 disk
    ├─sda1                 8:1    0  500M  0 part /boot
    └─sda2                 8:2    0  9.5G  0 part
      ├─cs-root          253:0    0  8.6G  0 lvm  /
      └─cs-swap          253:1    0  956M  0 lvm  [SWAP]
    sdb                    8:16   0    1G  0 disk
    ├─sdb1                 8:17   0  100M  0 part
    ├─sdb2                 8:18   0  200M  0 part
    │ ├─example_vg-mylv1 253:3    0  100M  0 lvm  /examplesfs/xfs
    │ └─example_vg-mylv2 253:4    0  200M  0 lvm  /examplesfs/ext4
    ├─sdb4                 8:20   0  512B  0 part
    └─sdb5                 8:21   0  200M  0 part
      └─example_vg-mylv2 253:4    0  200M  0 lvm  /examplesfs/ext4
    sdc                    8:32   0    1G  0 disk
    ├─sdc1                 8:33   0  100M  0 part /examplesfs/labels/xfs
    ├─sdc2                 8:34   0  100M  0 part /examplesfs/labels/ext4
    └─sdc3                 8:35   0  823M  0 part
    sdd                    8:48   0    1G  0 disk
    ├─sdd1                 8:49   0  200M  0 part [SWAP]
    └─sdd2                 8:50   0  200M  0 part
      └─MYSWAP-mymemswap 253:2    0  196M  0 lvm  [SWAP]
    sr0                   11:0    1 1024M  0 rom
[root@desk ~]# gdisk -l /dev/sdd
    GPT fdisk (gdisk) version 1.0.7

    Partition table scan:
      MBR: MBR only
      BSD: not present
      APM: not present
      GPT: not present


    ***************************************************************
    Found invalid GPT and valid MBR; converting MBR to GPT format
    in memory.
    ***************************************************************

    Disk /dev/sdd: 2097152 sectors, 1024.0 MiB
    Model: VBOX HARDDISK
    Sector size (logical/physical): 512/512 bytes
    Disk identifier (GUID): BCAF54D8-2B92-4FDE-954E-1A6096B4943B
    Partition table holds up to 128 entries
    Main partition table begins at sector 2 and ends at sector 33
    First usable sector is 34, last usable sector is 2097118
    Partitions will be aligned on 2048-sector boundaries
    Total free space is 1277885 sectors (624.0 MiB)

    Number  Start (sector)    End (sector)  Size       Code  Name
       1            2048          411647   200.0 MiB   8200  Linux swap
       2          411648          821247   200.0 MiB   8E00  Linux LVM
[root@desk ~]# fdisk /dev/sdd

    Welcome to fdisk (util-linux 2.37.4).
    Changes will remain in memory only, until you decide to write them.
    Be careful before using the write command.

    This disk is currently in use - repartitioning is probably a bad idea.
    It''s recommended to umount all file systems, and swapoff all swap
    partitions on this disk.


    Command (m for help): p

    Disk /dev/sdd: 1 GiB, 1073741824 bytes, 2097152 sectors
    Disk model: VBOX HARDDISK
    Units: sectors of 1 * 512 = 512 bytes
    Sector size (logical/physical): 512 bytes / 512 bytes
    I/O size (minimum/optimal): 512 bytes / 512 bytes
    Disklabel type: dos
    Disk identifier: 0x0f72d6e6

    Device     Boot  Start    End Sectors  Size Id Type
    /dev/sdd1         2048 411647  409600  200M 82 Linux swap / Solaris
    /dev/sdd2       411648 821247  409600  200M 8e Linux LVM

    Command (m for help): n
    Partition type
       p   primary (2 primary, 0 extended, 2 free)
       e   extended (container for logical partitions)
    Select (default p):

    Using default response p.
    Partition number (3,4, default 3):
    First sector (821248-2097151, default 821248):
    Last sector, +/-sectors or +/-size{K,M,G,T,P} (821248-2097151, default 2097151):

    Created a new partition 3 of type 'Linux' and of size 623 MiB.

    Command (m for help): p
    Disk /dev/sdd: 1 GiB, 1073741824 bytes, 2097152 sectors
    Disk model: VBOX HARDDISK
    Units: sectors of 1 * 512 = 512 bytes
    Sector size (logical/physical): 512 bytes / 512 bytes
    I/O size (minimum/optimal): 512 bytes / 512 bytes
    Disklabel type: dos
    Disk identifier: 0x0f72d6e6

    Device     Boot  Start     End Sectors  Size Id Type
    /dev/sdd1         2048  411647  409600  200M 82 Linux swap / Solaris
    /dev/sdd2       411648  821247  409600  200M 8e Linux LVM
    /dev/sdd3       821248 2097151 1275904  623M 83 Linux

    Command (m for help): t
    Partition number (1-3, default 3): 3
    Hex code or alias (type L to list all): 8e

    Changed type of partition 'Linux' to 'Linux LVM'.

    Command (m for help): p
    Disk /dev/sdd: 1 GiB, 1073741824 bytes, 2097152 sectors
    Disk model: VBOX HARDDISK
    Units: sectors of 1 * 512 = 512 bytes
    Sector size (logical/physical): 512 bytes / 512 bytes
    I/O size (minimum/optimal): 512 bytes / 512 bytes
    Disklabel type: dos
    Disk identifier: 0x0f72d6e6

    Device     Boot  Start     End Sectors  Size Id Type
    /dev/sdd1         2048  411647  409600  200M 82 Linux swap / Solaris
    /dev/sdd2       411648  821247  409600  200M 8e Linux LVM
    /dev/sdd3       821248 2097151 1275904  623M 8e Linux LVM

    Command (m for help): w
    The partition table has been altered.
    Syncing disks.

[root@desk ~]# partprobe
[root@desk ~]# lsblk
    NAME                 MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
    sda                    8:0    0   10G  0 disk
    ├─sda1                 8:1    0  500M  0 part /boot
    └─sda2                 8:2    0  9.5G  0 part
      ├─cs-root          253:0    0  8.6G  0 lvm  /
      └─cs-swap          253:1    0  956M  0 lvm  [SWAP]
    sdb                    8:16   0    1G  0 disk
    ├─sdb1                 8:17   0  100M  0 part
    ├─sdb2                 8:18   0  200M  0 part
    │ ├─example_vg-mylv1 253:3    0  100M  0 lvm  /examplesfs/xfs
    │ └─example_vg-mylv2 253:4    0  200M  0 lvm  /examplesfs/ext4
    ├─sdb4                 8:20   0  512B  0 part
    └─sdb5                 8:21   0  200M  0 part
      └─example_vg-mylv2 253:4    0  200M  0 lvm  /examplesfs/ext4
    sdc                    8:32   0    1G  0 disk
    ├─sdc1                 8:33   0  100M  0 part /examplesfs/labels/xfs
    ├─sdc2                 8:34   0  100M  0 part /examplesfs/labels/ext4
    └─sdc3                 8:35   0  823M  0 part
    sdd                    8:48   0    1G  0 disk
    ├─sdd1                 8:49   0  200M  0 part [SWAP]
    ├─sdd2                 8:50   0  200M  0 part
    │ └─MYSWAP-mymemswap 253:2    0  196M  0 lvm  [SWAP]
    └─sdd3                 8:51   0  623M  0 part
    sr0                   11:0    1 1024M  0 rom
# Create Physical Volumes
[root@desk ~]# pvcreate /dev/sdc3 /dev/sdd3
  Physical volume "/dev/sdc3" successfully created.
  Physical volume "/dev/sdd3" successfully created.
[root@desk ~]# pvs
  PV         VG         Fmt  Attr PSize   PFree
  /dev/sda2  cs         lvm2 a--   <9.51g      0
  /dev/sdb2  example_vg lvm2 a--  196.00m  92.00m
  /dev/sdb5  example_vg lvm2 a--  196.00m      0
  /dev/sdc3             lvm2 ---  822.98m 822.98m
  /dev/sdd2  MYSWAP     lvm2 a--  196.00m      0
  /dev/sdd3             lvm2 ---  623.00m 623.00m
# Create Volume Groups
[root@desk ~]# vgs
  VG         #PV #LV #SN Attr   VSize   VFree
  MYSWAP       1   1   0 wz--n- 196.00m     0
  cs           1   2   0 wz--n-  <9.51g     0
  example_vg   2   2   0 wz--n- 392.00m 92.00m

[root@desk ~]# vgdisplay cs
  --- Volume group ---
  VG Name               cs
  System ID
  Format                lvm2
  Metadata Areas        1
  Metadata Sequence No  3
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                2
  Open LV               2
  Max PV                0
  Cur PV                1
  Act PV                1
  VG Size               <9.51 GiB
  PE Size               4.00 MiB
  Total PE              2434
  Alloc PE / Size       2434 / <9.51 GiB
  Free  PE / Size       0 / 0
  VG UUID               TpUBXN-IQ3o-BawT-zuHJ-IVZi-U4da-UmSubX
# Extend Volume Group 
[root@desk ~]# vgextend cs /dev/sdc3 /dev/sdd3
  Volume group "cs" successfully extended
[root@desk ~]# vgdisplay cs
  --- Volume group ---
  VG Name               cs
  System ID
  Format                lvm2
  Metadata Areas        3
  Metadata Sequence No  4
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                2
  Open LV               2
  Max PV                0
  Cur PV                3
  Act PV                3
  VG Size               10.91 GiB
  PE Size               4.00 MiB
  Total PE              2794
  Alloc PE / Size       2434 / <9.51 GiB
  Free  PE / Size       360 / <1.41 GiB
  VG UUID               TpUBXN-IQ3o-BawT-zuHJ-IVZi-U4da-UmSubX
# Rsize LV and File System with one command
[root@desk ~]# df -h
    Filesystem                    Size  Used Avail Use% Mounted on
    devtmpfs                      4.0M     0  4.0M   0% /dev
    tmpfs                         876M     0  876M   0% /dev/shm
    tmpfs                         351M  1.4M  349M   1% /run
    /dev/mapper/cs-root           8.6G  4.9G  3.7G  58% /
    /dev/sda1                     436M  294M  143M  68% /boot
    /dev/sdc1                      95M  6.0M   89M   7% /examplesfs/labels/xfs
    /dev/mapper/example_vg-mylv1   95M  6.0M   89M   7% /examplesfs/xfs
    /dev/sdc2                      89M   14K   82M   1% /examplesfs/labels/ext4
    /dev/mapper/example_vg-mylv2  182M   14K  168M   1% /examplesfs/ext4
    tmpfs                         176M   60K  176M   1% /run/user/42
    tmpfs                         176M   40K  176M   1% /run/user/1000
[root@desk ~]# lvresize -r -l +360 /dev/cs/root
      Size of logical volume cs/root changed from 8.57 GiB (2195 extents) to 9.98 GiB (2555 extents).
      File system xfs found on cs/root mounted at /.
      Extending file system xfs to 9.98 GiB (10716446720 bytes) on cs/root...
    xfs_growfs /dev/cs/root
    meta-data=/dev/mapper/cs-root    isize=512    agcount=4, agsize=561920 blks
             =                       sectsz=512   attr=2, projid32bit=1
             =                       crc=1        finobt=1, sparse=1, rmapbt=0
             =                       reflink=1    bigtime=1 inobtcount=1 nrext64=0
    data     =                       bsize=4096   blocks=2247680, imaxpct=25
             =                       sunit=0      swidth=0 blks
    naming   =version 2              bsize=4096   ascii-ci=0, ftype=1
    log      =internal log           bsize=4096   blocks=16384, version=2
             =                       sectsz=512   sunit=0 blks, lazy-count=1
    realtime =none                   extsz=4096   blocks=0, rtextents=0
    data blocks changed from 2247680 to 2616320
    xfs_growfs done
      Extended file system xfs on cs/root.
      Logical volume cs/root successfully resized.
[root@desk ~]# df -h
    Filesystem                    Size  Used Avail Use% Mounted on
    devtmpfs                      4.0M     0  4.0M   0% /dev
    tmpfs                         876M     0  876M   0% /dev/shm
    tmpfs                         351M  1.4M  349M   1% /run
    /dev/mapper/cs-root            10G  4.9G  5.1G  50% /
    /dev/sda1                     436M  294M  143M  68% /boot
    /dev/sdc1                      95M  6.0M   89M   7% /examplesfs/labels/xfs
    /dev/mapper/example_vg-mylv1   95M  6.0M   89M   7% /examplesfs/xfs
    /dev/sdc2                      89M   14K   82M   1% /examplesfs/labels/ext4
    /dev/mapper/example_vg-mylv2  182M   14K  168M   1% /examplesfs/ext4
    tmpfs                         176M   60K  176M   1% /run/user/42
    tmpfs                         176M   40K  176M   1% /run/user/1000
# 
################################################################################################################################
################################################################################################################################
################################################################################################################################



################################################################################################################################
################################################################################################################################
################################################################################################################################



################################################################################################################################
################################################################################################################################
################################################################################################################################



################################################################################################################################
################################################################################################################################
################################################################################################################################
