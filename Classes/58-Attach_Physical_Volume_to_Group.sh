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
  └─sdb2        8:18   0  200M  0 part
  sdc           8:32   0    1G  0 disk
  └─sdc1        8:33   0  100M  0 part
  sdd           8:48   0    1G  0 disk
  sr0          11:0    1 1024M  0 rom

##############################################################################################################
#### Let's create another partion on /dev/sdb so we can use in our Volume Group
# Create an Extended Partition as /dev/sdb5 with the remaining storage for /dev/sdb
# Create /dev/sdb5 Logical Partition on top of /dev/sdb4 with 200M
# Change type of /dev/sdb5 Logical Partition to Linux LVM
# Create a Physical Volume on top of /dev/sdb5
# Add Physical Volumes /dev/sdb2 to example_vg Volume Group
# Extend Volume Group example_vg with /dev/sdb5

[root@desk ~]# fdisk /dev/sdb

  Welcome to fdisk (util-linux 2.37.4).
  Changes will remain in memory only, until you decide to write them.
  Be careful before using the write command.

  This disk is currently in use - repartitioning is probably a bad idea.
  It''s recommended to umount all file systems, and swapoff all swap
  partitions on this disk.


  Command (m for help): p

    Disk /dev/sdb: 1 GiB, 1073741824 bytes, 2097152 sectors
    Disk model: VBOX HARDDISK
    Units: sectors of 1 * 512 = 512 bytes
    Sector size (logical/physical): 512 bytes / 512 bytes
    I/O size (minimum/optimal): 512 bytes / 512 bytes
    Disklabel type: dos
    Disk identifier: 0x0b8b30c2

    Device     Boot  Start    End Sectors  Size Id Type
    /dev/sdb1         2048 206847  204800  100M 83 Linux
    /dev/sdb2       206848 616447  409600  200M 8e Linux LVM

  Command (m for help): n
    Partition type
      p   primary (2 primary, 0 extended, 2 free)
      e   extended (container for logical partitions)
    Select (default p): e
    Partition number (3,4, default 3): 4
    First sector (616448-2097151, default 616448):
    Last sector, +/-sectors or +/-size{K,M,G,T,P} (616448-2097151, default 2097151):

    Created a new partition 4 of type 'Extended' and of size 723 MiB.

# Partition /dev/sdb4 created as Extended with the remaining storage for /dev/sdb
  Command (m for help): p
    Disk /dev/sdb: 1 GiB, 1073741824 bytes, 2097152 sectors
    Disk model: VBOX HARDDISK
    Units: sectors of 1 * 512 = 512 bytes
    Sector size (logical/physical): 512 bytes / 512 bytes
    I/O size (minimum/optimal): 512 bytes / 512 bytes
    Disklabel type: dos
    Disk identifier: 0x0b8b30c2

    Device     Boot  Start     End Sectors  Size Id Type
    /dev/sdb1         2048  206847  204800  100M 83 Linux
    /dev/sdb2       206848  616447  409600  200M 8e Linux LVM
    /dev/sdb4       616448 2097151 1480704  723M  5 Extended

  
# Note that All space for primary partitions is in use.
# Logical Partition /dev/sdb5 will be created on top of the Extended Partition /dev/sdb4
  Command (m for help):  n
    All space for primary partitions is in use.
    Adding logical partition 5
    First sector (618496-2097151, default 618496): +200M
    Value out of range.
    First sector (618496-2097151, default 618496):
    Last sector, +/-sectors or +/-size{K,M,G,T,P} (618496-2097151, default 2097151): +200M

    Created a new partition 5 of type 'Linux' and of size 200 MiB.
# Logical Partition /dev/sdb5 created
  Command (m for help): p
    Disk /dev/sdb: 1 GiB, 1073741824 bytes, 2097152 sectors
    Disk model: VBOX HARDDISK
    Units: sectors of 1 * 512 = 512 bytes
    Sector size (logical/physical): 512 bytes / 512 bytes
    I/O size (minimum/optimal): 512 bytes / 512 bytes
    Disklabel type: dos
    Disk identifier: 0x0b8b30c2

    Device     Boot  Start     End Sectors  Size Id Type
    /dev/sdb1         2048  206847  204800  100M 83 Linux
    /dev/sdb2       206848  616447  409600  200M 8e Linux LVM
    /dev/sdb4       616448 2097151 1480704  723M  5 Extended
    /dev/sdb5       618496 1028095  409600  200M 83 Linux

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

# Change Logical Partition /dev/sdb5 type to Linux LVM
  Command (m for help): t
    Partition number (1,2,4,5, default 5): 5
    Hex code or alias (type L to list all): 8e

    Changed type of partition 'Linux' to 'Linux LVM'.

  Command (m for help): p
    Disk /dev/sdb: 1 GiB, 1073741824 bytes, 2097152 sectors
    Disk model: VBOX HARDDISK
    Units: sectors of 1 * 512 = 512 bytes
    Sector size (logical/physical): 512 bytes / 512 bytes
    I/O size (minimum/optimal): 512 bytes / 512 bytes
    Disklabel type: dos
    Disk identifier: 0x0b8b30c2

    Device     Boot  Start     End Sectors  Size Id Type
    /dev/sdb1         2048  206847  204800  100M 83 Linux
    /dev/sdb2       206848  616447  409600  200M 8e Linux LVM
    /dev/sdb4       616448 2097151 1480704  723M  5 Extended
    /dev/sdb5       618496 1028095  409600  200M 8e Linux LVM

  Command (m for help): w
    The partition table has been altered.
    Syncing disks.

[root@desk ~]# partprobe
[root@desk ~]# fdisk -l /dev/sdb
  Disk /dev/sdb: 1 GiB, 1073741824 bytes, 2097152 sectors
  Disk model: VBOX HARDDISK
  Units: sectors of 1 * 512 = 512 bytes
  Sector size (logical/physical): 512 bytes / 512 bytes
  I/O size (minimum/optimal): 512 bytes / 512 bytes
  Disklabel type: dos
  Disk identifier: 0x0b8b30c2

  Device     Boot  Start     End Sectors  Size Id Type
  /dev/sdb1         2048  206847  204800  100M 83 Linux
  /dev/sdb2       206848  616447  409600  200M 8e Linux LVM
  /dev/sdb4       616448 2097151 1480704  723M  5 Extended
  /dev/sdb5       618496 1028095  409600  200M 8e Linux LVM


[root@desk ~]# pvs
  PV         VG Fmt  Attr PSize   PFree
  /dev/sda2  cs lvm2 a--   <9.51g      0
  /dev/sdb2     lvm2 ---  200.00m 200.00m
# Physical Volume /dev/sdb5 created
[root@desk ~]# pvcreate /dev/sdb5
  Physical volume "/dev/sdb5" successfully created.

# Volume Group example_vg created and added /dev/sdb2 to it
[root@desk ~]# vgcreate example_vg /dev/sdb2
  Volume group "example_vg" successfully created
[root@desk ~]# vgdisplay example_vg
  --- Volume group ---
  VG Name               example_vg
  System ID
  Format                lvm2
  Metadata Areas        1
  Metadata Sequence No  1
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                0
  Open LV               0
  Max PV                0
  Cur PV                1
  Act PV                1
  VG Size               196.00 MiB
  PE Size               4.00 MiB
  Total PE              49
  Alloc PE / Size       0 / 0
  Free  PE / Size       49 / 196.00 MiB
  VG UUID               Zo494O-dOMq-3Myw-ZRdQ-aDdn-vhIi-fpaHpX 
 
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

# Extend Volume Group example_vg with /dev/sdb5
[root@desk ~]# vgextend example_vg /dev/sdb5
  Volume group "example_vg" successfully extended

# VG Size = Volume Group = /dev/sdb2 + /dev/sdb5 = 200M + 200M
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

[root@desk ~]# vgs
  VG         #PV #LV #SN Attr   VSize   VFree
  cs           1   2   0 wz--n-  <9.51g      0
  example_vg   2   0   0 wz--n- 392.00m 392.00m

