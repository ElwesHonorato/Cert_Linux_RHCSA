# Crie um grupo de volume lógico meuvolume, e em cima dele crie 2 LVM:

# 1 de 400M chamado meulvm1, montado em /discos/lmv1 com arquivo de sistemas XFS

# 1 de 200M chamado meulvm2 montado em /discos/lvm2 com arquivo de sistemas EXT4

[root@dev1 ~]# vgs
  VG     #PV #LV #SN Attr   VSize   VFree
  cs       1   2   0 wz--n-  <9.51g    0
  myswap   2   1   0 wz--n- 392.00m    0
[root@dev1 ~]# pvs
  PV         VG     Fmt  Attr PSize   PFree
  /dev/sda2  cs     lvm2 a--   <9.51g    0
  /dev/sdb4  myswap lvm2 a--  196.00m    0
  /dev/sdb5  myswap lvm2 a--  196.00m    0
[root@dev1 ~]# lvs
  LV        VG     Attr       LSize   Pool Origin Data%  Meta%  Move Log Cpy%Sync Convert
  root      cs     -wi-ao----   8.57g
  swap      cs     -wi-ao---- 956.00m
  lv_swap_1 myswap -wi-ao---- 392.00m
[root@dev1 ~]# pvcreate /dev/sdb1 /dev/sdb2
  Physical volume "/dev/sdb1" successfully created.
  Physical volume "/dev/sdb2" successfully created.
[root@dev1 ~]# pvcreate /dev/sdb3
  Physical volume "/dev/sdb3" successfully created.
[root@dev1 ~]# vgcreate myvolume /dev/sdb1 /dev/sdb2
  Volume group "myvolume" successfully created
[root@dev1 ~]# vgextend myvolume /dev/sdb3
  Volume group "myvolume" successfully extended
[root@dev1 ~]# pvs
  PV         VG       Fmt  Attr PSize   PFree
  /dev/sda2  cs       lvm2 a--   <9.51g      0
  /dev/sdb1  myvolume lvm2 a--  196.00m 196.00m
  /dev/sdb2  myvolume lvm2 a--  196.00m 196.00m
  /dev/sdb3  myvolume lvm2 a--  196.00m 196.00m
  /dev/sdb4  myswap   lvm2 a--  196.00m      0
  /dev/sdb5  myswap   lvm2 a--  196.00m      0

[root@dev1 ~]# vgs
  VG       #PV #LV #SN Attr   VSize   VFree
  cs         1   2   0 wz--n-  <9.51g      0
  myswap     2   1   0 wz--n- 392.00m      0
  myvolume   3   0   0 wz--n- 588.00m 588.00m

[root@dev1 ~]# lvs
  LV        VG     Attr       LSize   Pool Origin Data%  Meta%  Move Log Cpy%Sync Convert
  root      cs     -wi-ao----   8.57g
  swap      cs     -wi-ao---- 956.00m
  lv_swap_1 myswap -wi-ao---- 392.00m
[root@dev1 ~]# vgdisplay /dev/myvolume
  --- Volume group ---
  VG Name               myvolume
  System ID
  Format                lvm2
  Metadata Areas        3
  Metadata Sequence No  2
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                0
  Open LV               0
  Max PV                0
  Cur PV                3
  Act PV                3
  VG Size               588.00 MiB
  PE Size               4.00 MiB
  Total PE              147
  Alloc PE / Size       0 / 0
  Free  PE / Size       147 / 588.00 MiB
  VG UUID               12uQQp-DI6t-JeLG-EuHl-x3zT-au3n-N2y0H5

[root@dev1 ~]# lvcreate -l 50 -n mylvm1 myvolume
  Logical volume "mylvm1" created.
[root@dev1 ~]# lvcreate -L 400 -n mylvm2 myvolume
  Volume group "myvolume" has insufficient free space (97 extents): 100 required.
[root@dev1 ~]# lvcreate -L 388 -n mylvm2 myvolume
  Logical volume "mylvm2" created.
[root@dev1 ~]# vgdisplay /dev/myvolume
  --- Volume group ---
  VG Name               myvolume
  System ID
  Format                lvm2
  Metadata Areas        3
  Metadata Sequence No  4
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                2
  Open LV               0
  Max PV                0
  Cur PV                3
  Act PV                3
  VG Size               588.00 MiB
  PE Size               4.00 MiB
  Total PE              147
  Alloc PE / Size       147 / 588.00 MiB
  Free  PE / Size       0 / 0
  VG UUID               12uQQp-DI6t-JeLG-EuHl-x3zT-au3n-N2y0H5

[root@dev1 ~]# mkfs.xfs /dev/myvolume/mylvm1
    Filesystem should be larger than 300MB.
    Log size should be at least 64MB.
    Support for filesystems like this one is deprecated and they will not be supported in future releases.
    meta-data=/dev/myvolume/mylvm1   isize=512    agcount=4, agsize=12800 blks
             =                       sectsz=512   attr=2, projid32bit=1
             =                       crc=1        finobt=1, sparse=1, rmapbt=0
             =                       reflink=1    bigtime=1 inobtcount=1 nrext64=0
    data     =                       bsize=4096   blocks=51200, imaxpct=25
             =                       sunit=0      swidth=0 blks
    naming   =version 2              bsize=4096   ascii-ci=0, ftype=1
    log      =internal log           bsize=4096   blocks=1368, version=2
             =                       sectsz=512   sunit=0 blks, lazy-count=1
    realtime =none                   extsz=4096   blocks=0, rtextents=0
[root@dev1 ~]# mkfs.ext4 /dev/myvolume/mylvm2
    mke2fs 1.46.5 (30-Dec-2021)
    Creating filesystem with 397312 1k blocks and 99176 inodes
    Filesystem UUID: 47312bf6-c9c2-4900-88a9-0701600179a3
    Superblock backups stored on blocks:
            8193, 24577, 40961, 57345, 73729, 204801, 221185

    Allocating group tables: done
    Writing inode tables: done
    Creating journal (8192 blocks): done
    Writing superblocks and filesystem accounting information: done
[root@dev1 ~]# lsblk
    NAME                 MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
    sda                    8:0    0   10G  0 disk
    ├─sda1                 8:1    0  500M  0 part /boot
    └─sda2                 8:2    0  9.5G  0 part
      ├─cs-root          253:0    0  8.6G  0 lvm  /
      └─cs-swap          253:1    0  956M  0 lvm  [SWAP]
    sdb                    8:16   0    1G  0 disk
    ├─sdb1                 8:17   0  200M  0 part
    ├─sdb2                 8:18   0  200M  0 part
    ├─sdb3                 8:19   0  200M  0 part
    ├─sdb4                 8:20   0  200M  0 part
    │ └─myswap-lv_swap_1 253:2    0  392M  0 lvm  [SWAP]
    └─sdb5                 8:21   0  200M  0 part
      └─myswap-lv_swap_1 253:2    0  392M  0 lvm  [SWAP]
    sdc                    8:32   0    1G  0 disk
    sdd                    8:48   0    1G  0 disk
    sr0                   11:0    1 1024M  0 rom

[root@dev1 ~]# mkdir -p /disks/lvm1 /disks/lvm2
[root@dev1 ~]# ls -R /disks
    /disks:
    lvm1  lvm2

    /disks/lvm1:

    /disks/lvm2:
[root@dev1 ~]# mount /dev/myvolume/mylvm1 /disks/lvm1
[root@dev1 ~]# mount /dev/myvolume/mylvm2 /disks/lvm2
[root@dev1 ~]# lsblk
    NAME                 MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
    sda                    8:0    0   10G  0 disk
    ├─sda1                 8:1    0  500M  0 part /boot
    └─sda2                 8:2    0  9.5G  0 part
      ├─cs-root          253:0    0  8.6G  0 lvm  /
      └─cs-swap          253:1    0  956M  0 lvm  [SWAP]
    sdb                    8:16   0    1G  0 disk
    ├─sdb1                 8:17   0  200M  0 part
    │ └─myvolume-mylvm1  253:3    0  200M  0 lvm  /disks/lvm1
    ├─sdb2                 8:18   0  200M  0 part
    │ ├─myvolume-mylvm1  253:3    0  200M  0 lvm  /disks/lvm1
    │ └─myvolume-mylvm2  253:4    0  388M  0 lvm  /disks/lvm2
    ├─sdb3                 8:19   0  200M  0 part
    │ └─myvolume-mylvm2  253:4    0  388M  0 lvm  /disks/lvm2
    ├─sdb4                 8:20   0  200M  0 part
    │ └─myswap-lv_swap_1 253:2    0  392M  0 lvm  [SWAP]
    └─sdb5                 8:21   0  200M  0 part
      └─myswap-lv_swap_1 253:2    0  392M  0 lvm  [SWAP]
    sdc                    8:32   0    1G  0 disk
    sdd                    8:48   0    1G  0 disk
    sr0                   11:0    1 1024M  0 rom
[root@dev1 ~]# vgs
  VG       #PV #LV #SN Attr   VSize   VFree
  cs         1   2   0 wz--n-  <9.51g    0
  myswap     2   1   0 wz--n- 392.00m    0
  myvolume   3   2   0 wz--n- 588.00m    0
[root@dev1 ~]# lvs
  LV        VG       Attr       LSize   Pool Origin Data%  Meta%  Move Log Cpy%Sync Convert
  root      cs       -wi-ao----   8.57g
  swap      cs       -wi-ao---- 956.00m
  lv_swap_1 myswap   -wi-ao---- 392.00m
  mylvm1    myvolume -wi-ao---- 200.00m
  mylvm2    myvolume -wi-ao---- 388.00m
[root@dev1 ~]# pvs
  PV         VG       Fmt  Attr PSize   PFree
  /dev/sda2  cs       lvm2 a--   <9.51g    0
  /dev/sdb1  myvolume lvm2 a--  196.00m    0
  /dev/sdb2  myvolume lvm2 a--  196.00m    0
  /dev/sdb3  myvolume lvm2 a--  196.00m    0
  /dev/sdb4  myswap   lvm2 a--  196.00m    0
  /dev/sdb5  myswap   lvm2 a--  196.00m    0
[root@dev1 ~]# vgdisplay myvolume
  --- Volume group ---
  VG Name               myvolume
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
  VG Size               588.00 MiB
  PE Size               4.00 MiB
  Total PE              147
  Alloc PE / Size       147 / 588.00 MiB
  Free  PE / Size       0 / 0
  VG UUID               12uQQp-DI6t-JeLG-EuHl-x3zT-au3n-N2y0H5