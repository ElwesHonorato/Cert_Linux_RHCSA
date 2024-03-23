##############################################################################################################
#### Discovery
[root@desk ~]# lsblk
    NAME        MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
    sda           8:0    0   10G  0 disk
    ├─sda1        8:1    0  500M  0 part /boot
    └─sda2        8:2    0  9.5G  0 part
    ├─cs-root 253:0    0  8.6G  0 lvm  /
    └─cs-swap 253:1    0  956M  0 lvm  [SWAP]
    sdb           8:16   0    1G  0 disk
    ├─sdb1        8:17   0  100M  0 part /examplesfs/xfs
    ├─sdb2        8:18   0  200M  0 part
    ├─sdb4        8:20   0  512B  0 part
    └─sdb5        8:21   0  200M  0 part
    sdc           8:32   0    1G  0 disk
    └─sdc1        8:33   0  100M  0 part
    sdd           8:48   0    1G  0 disk
    sr0          11:0    1 1024M  0 rom
[root@desk ~]# pvs
  PV         VG         Fmt  Attr PSize   PFree
  /dev/sda2  cs         lvm2 a--   <9.51g      0
  /dev/sdb2  example_vg lvm2 a--  196.00m 196.00m
  /dev/sdb5  example_vg lvm2 a--  196.00m 196.00m
[root@desk ~]# vgs
  VG         #PV #LV #SN Attr   VSize   VFree
  cs           1   2   0 wz--n-  <9.51g      0
  example_vg   2   0   0 wz--n- 392.00m 392.00m

# PE means Physical Extension
    # Total PE * PE Size = VG Size = 95 * 4 = 392MB
[root@desk ~]# vgdisplay example_vg
  --- Volume group ---
  VG Name               example_vg
  System ID
  Format                lvm2
  Metadata Areas        2
  Metadata Sequence No  2
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
  VG UUID               Zo494O-dOMq-3Myw-ZRdQ-aDdn-vhIi-fpaHpX
##############################################################################################################
#### Create Logical Volumes [ mylv1 ]
# Create a Logical Volume mylv1 from Volume Group example_vg with 100M using option -L
# Install xfs File System om mylv1
# Mount mylv1 to /examplefs/xfs/mytestfile

# Logical Volume created with the option -L, so it was created based on the Volume Group size
[root@desk ~]# lvcreate -L 100M -n mylv1 example_vg
    WARNING: xfs signature detected on /dev/example_vg/mylv1 at offset 0. Wipe it? [y/n]: y
      Wiping xfs signature on /dev/example_vg/mylv1.
      Logical volume "mylv1" created.

# Logical Volume mylv1 created from Volume Group example_vg
[root@desk ~]# lvs
  LV    VG         Attr       LSize   Pool Origin Data%  Meta%  Move Log Cpy%Sync Convert
  root  cs         -wi-ao----   8.57g
  swap  cs         -wi-ao---- 956.00m
  mylv1 example_vg -wi-a----- 100.00m

[root@desk ~]# lsblk
    NAME                 MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
    sda                    8:0    0   10G  0 disk
    ├─sda1                 8:1    0  500M  0 part /boot
    └─sda2                 8:2    0  9.5G  0 part
      ├─cs-root          253:0    0  8.6G  0 lvm  /
      └─cs-swap          253:1    0  956M  0 lvm  [SWAP]
    sdb                    8:16   0    1G  0 disk
    ├─sdb1                 8:17   0  100M  0 part /examplesfs/xfs
    ├─sdb2                 8:18   0  200M  0 part
    │ └─example_vg-mylv1 253:2    0  100M  0 lvm
    ├─sdb4                 8:20   0  512B  0 part
    └─sdb5                 8:21   0  200M  0 part
    sdc                    8:32   0    1G  0 disk
    └─sdc1                 8:33   0  100M  0 part
    sdd                    8:48   0    1G  0 disk
    sr0                   11:0    1 1024M  0 rom
 
# Logical Volume mylv1 formated as xfs
[root@desk ~]# mkfs.xfs /dev/example_vg/mylv1
    Filesystem should be larger than 300MB.
    Log size should be at least 64MB.
    Support for filesystems like this one is deprecated and they will not be supported in future releases.
    meta-data=/dev/example_vg/mylv1  isize=512    agcount=4, agsize=6400 blks
             =                       sectsz=512   attr=2, projid32bit=1
             =                       crc=1        finobt=1, sparse=1, rmapbt=0
             =                       reflink=1    bigtime=1 inobtcount=1 nrext64=0
    data     =                       bsize=4096   blocks=25600, imaxpct=25
             =                       sunit=0      swidth=0 blks
    naming   =version 2              bsize=4096   ascii-ci=0, ftype=1
    log      =internal log           bsize=4096   blocks=1368, version=2
             =                       sectsz=512   sunit=0 blks, lazy-count=1
    realtime =none                   extsz=4096   blocks=0, rtextents=0
# Umount /dev/sdb1 to make my system to be in sync with the instructor's system. 
[root@desk ~]# umount /dev/sdb1
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
    │ └─example_vg-mylv1 253:2    0  100M  0 lvm
    ├─sdb4                 8:20   0  512B  0 part
    └─sdb5                 8:21   0  200M  0 part
    sdc                    8:32   0    1G  0 disk
    └─sdc1                 8:33   0  100M  0 part
    sdd                    8:48   0    1G  0 disk
    sr0                   11:0    1 1024M  0 rom
[root@desk ~]# ls /examplesfs/xfs
# mylv1 mounted to /examplesfs/xfs
[root@desk ~]# mount /dev/example_vg/mylv1 /examplesfs/xfs
[root@desk ~]# touch /examplefs/xfs/mytestfile
[root@desk ~]# ls /examplesfs/xfs
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
    │ └─example_vg-mylv1 253:2    0  100M  0 lvm  /examplesfs/xfs
    ├─sdb4                 8:20   0  512B  0 part
    └─sdb5                 8:21   0  200M  0 part
    sdc                    8:32   0    1G  0 disk
    └─sdc1                 8:33   0  100M  0 part
    sdd                    8:48   0    1G  0 disk
    sr0                   11:0    1 1024M  0 rom


##############################################################################################################
#### Create Logical Volumes [ mylv2 ]
# Create a Logical Volume mylv2 from Volume Group example_vg with 100M using PEs ( Physical Extension ) 
    # option -l
# Remove Logical Volume example_vg-mylv2

[root@desk xfs]# vgdisplay example_vg
  --- Volume group ---
  VG Name               example_vg
  System ID
  Format                lvm2
  Metadata Areas        2
  Metadata Sequence No  3
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                1
  Open LV               1
  Max PV                0
  Cur PV                2
  Act PV                2
  VG Size               392.00 MiB
  PE Size               4.00 MiB
  Total PE              98
  Alloc PE / Size       25 / 100.00 MiB
  Free  PE / Size       73 / 292.00 MiB
  VG UUID               Zo494O-dOMq-3Myw-ZRdQ-aDdn-vhIi-fpaHpX
# Logical Volume mylv2 created with 50 PE (Physical Extension)
[root@desk xfs]# lvcreate -l 50 -n mylv2 example_vg
    WARNING: ext4 signature detected on /dev/example_vg/mylv2 at offset 1080. Wipe it? [y/n]: y
      Wiping ext4 signature on /dev/example_vg/mylv2.
      Logical volume "mylv2" created.
[root@desk xfs]# lvs
  LV    VG         Attr       LSize   Pool Origin Data%  Meta%  Move Log Cpy%Sync Convert
  root  cs         -wi-ao----   8.57g
  swap  cs         -wi-ao---- 956.00m
  mylv1 example_vg -wi-ao---- 100.00m
  mylv2 example_vg -wi-a----- 200.00m
[root@desk xfs]# lsblk
    NAME                 MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
    sda                    8:0    0   10G  0 disk
    ├─sda1                 8:1    0  500M  0 part /boot
    └─sda2                 8:2    0  9.5G  0 part
      ├─cs-root          253:0    0  8.6G  0 lvm  /
      └─cs-swap          253:1    0  956M  0 lvm  [SWAP]
    sdb                    8:16   0    1G  0 disk
    ├─sdb1                 8:17   0  100M  0 part
    ├─sdb2                 8:18   0  200M  0 part
    │ ├─example_vg-mylv1 253:2    0  100M  0 lvm  /examplesfs/xfs
    │ └─example_vg-mylv2 253:3    0  200M  0 lvm
    ├─sdb4                 8:20   0  512B  0 part
    └─sdb5                 8:21   0  200M  0 part
      └─example_vg-mylv2 253:3    0  200M  0 lvm
    sdc                    8:32   0    1G  0 disk
    └─sdc1                 8:33   0  100M  0 part
    sdd                    8:48   0    1G  0 disk
    sr0                   11:0    1 1024M  0 rom
[root@desk xfs]# vgdisplay example_vg
  --- Volume group ---
  VG Name               example_vg
  System ID
  Format                lvm2
  Metadata Areas        2
  Metadata Sequence No  4
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                2
  Open LV               1
  Max PV                0
  Cur PV                2
  Act PV                2
  VG Size               392.00 MiB
  PE Size               4.00 MiB
  Total PE              98
  Alloc PE / Size       75 / 300.00 MiB
  Free  PE / Size       23 / 92.00 MiB
  VG UUID               Zo494O-dOMq-3Myw-ZRdQ-aDdn-vhIi-fpaHpX
# Logical Volume example_vg/mylv2 removed
[root@desk ~]# lvremove example_vg/mylv2
    Do you really want to remove active logical volume example_vg/mylv2? [y/n]: y
      Logical volume "mylv2" successfully removed.
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
    │ └─example_vg-mylv1 253:2    0  100M  0 lvm  /examplesfs/xfs
    ├─sdb4                 8:20   0  512B  0 part
    └─sdb5                 8:21   0  200M  0 part
    sdc                    8:32   0    1G  0 disk
    └─sdc1                 8:33   0  100M  0 part
    sdd                    8:48   0    1G  0 disk
    sr0                   11:0    1 1024M  0 rom
[root@desk ~]# lvs
  LV    VG         Attr       LSize   Pool Origin Data%  Meta%  Move Log Cpy%Sync Convert
  root  cs         -wi-ao----   8.57g
  swap  cs         -wi-ao---- 956.00m
  mylv1 example_vg -wi-ao---- 100.00m