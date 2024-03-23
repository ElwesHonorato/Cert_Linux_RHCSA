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

# To crete a PV a LVM partition is required
# /dev/sdb2 is a Linux LVM created in the previous lesson
[root@desk ~]# fdisk -l /dev/sdb
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

# Create physical volume /dev/sdb2
[root@desk ~]# pvcreate /dev/sdb2
  Physical volume "/dev/sdb2" successfully created.
# Check results with pvdisplay or pvs
[root@desk ~]# pvdisplay
  --- Physical volume ---
  PV Name               /dev/sda2
  VG Name               cs
  PV Size               9.51 GiB / not usable 3.00 MiB
  Allocatable           yes (but full)
  PE Size               4.00 MiB
  Total PE              2434
  Free PE               0
  Allocated PE          2434
  PV UUID               01r8N3-pKgY-bHbi-xVRa-n838-Ktei-7mbyqj

  "/dev/sdb2" is a new physical volume of "200.00 MiB"
  --- NEW Physical volume ---
  PV Name               /dev/sdb2
  VG Name
  PV Size               200.00 MiB
  Allocatable           NO
  PE Size               0
  Total PE              0
  Free PE               0
  Allocated PE          0
  PV UUID               c6KCZh-2fSk-gXDc-WXLC-sII6-Oy6e-TLLqwc

[root@desk ~]# pvs
  PV         VG Fmt  Attr PSize   PFree
  /dev/sda2  cs lvm2 a--   <9.51g      0
  /dev/sdb2     lvm2 ---  200.00m 200.00m
# !!! - LVM allows us to use GPT and MBR together, as long as the type of both is Linux LVM
[root@desk ~]# pvremove /dev/sdb2
  Labels on physical volume "/dev/sdb2" successfully wiped.
[root@desk ~]# pvs
  PV         VG Fmt  Attr PSize  PFree
  /dev/sda2  cs lvm2 a--  <9.51g    0
[root@desk ~]# pvcreate /dev/sdb2
  WARNING: adding device /dev/sdb2 with idname t10.ATA_VBOX_HARDDISK_VB471e1bfe-ad205db6 which is already used for missing device.
  Physical volume "/dev/sdb2" successfully created.
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
