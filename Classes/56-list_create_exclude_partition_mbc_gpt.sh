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
    sdc           8:32   0    1G  0 disk
    sdd           8:48   0    1G  0 disk
    sr0          11:0    1 1024M  0 rom

# There are no partitions present
[root@desk ~]# gdisk -l /dev/sdb
    GPT fdisk (gdisk) version 1.0.7

    Partition table scan:
      MBR: not present
      BSD: not present
      APM: not present
      GPT: not present

    Creating new GPT entries in memory.
    Disk /dev/sdb: 2097152 sectors, 1024.0 MiB
    Model: VBOX HARDDISK
    Sector size (logical/physical): 512/512 bytes
    Disk identifier (GUID): 79C52B8E-C58D-4A4E-B1D6-5E5B2BB568D1
    Partition table holds up to 128 entries
    Main partition table begins at sector 2 and ends at sector 33
    First usable sector is 34, last usable sector is 2097118
    Partitions will be aligned on 2048-sector boundaries
    Total free space is 2097085 sectors (1024.0 MiB)

    Number  Start (sector)    End (sector)  Size       Code  Name

# Different from gdisk -l /dev/sdb, fdisk -l /dev/sdb doesn't do a full read of the partitions
# So, for partition details gdisk -l /dev/sdb is recommended
[root@desk ~]# fdisk -l /dev/sdb
    Disk /dev/sdb: 1 GiB, 1073741824 bytes, 2097152 sectors
    Disk model: VBOX HARDDISK
    Units: sectors of 1 * 512 = 512 bytes
    Sector size (logical/physical): 512 bytes / 512 bytes
    I/O size (minimum/optimal): 512 bytes / 512 bytes

##############################################################################################################
#### Create a MBR Partition in /dev/sdb with fdisk and mount a File System to it
# First let's configure nas MBR Partition
# For MBR fdisk should be used
[root@desk ~]# fdisk /dev/sdb

    Welcome to fdisk (util-linux 2.37.4).
    Changes will remain in memory only, until you decide to write them.
    Be careful before using the write command.

    Device does not contain a recognized partition table.
    Created a new DOS disklabel with disk identifier 0x0b8b30c2.

    Command (m for help): m

    Help:

      DOS (MBR)
       a   toggle a bootable flag
       b   edit nested BSD disklabel
       c   toggle the dos compatibility flag

      Generic
       d   delete a partition
       F   list free unpartitioned space
       l   list known partition types
       n   add a new partition
       p   print the partition table
       t   change a partition type
       v   verify the partition table
       i   print information about a partition

      Misc
       m   print this menu
       u   change display/entry units
       x   extra functionality (experts only)

      Script
       I   load disk layout from sfdisk script file
       O   dump disk layout to sfdisk script file

      Save & Exit
       w   write table to disk and exit
       q   quit without saving changes

      Create a new label
       g   create a new empty GPT partition table
       G   create a new empty SGI (IRIX) partition table
       o   create a new empty DOS partition table
       s   create a new empty Sun partition table


    Command (m for help): p
    Disk /dev/sdb: 1 GiB, 1073741824 bytes, 2097152 sectors
    Disk model: VBOX HARDDISK
    Units: sectors of 1 * 512 = 512 bytes
    Sector size (logical/physical): 512 bytes / 512 bytes
    I/O size (minimum/optimal): 512 bytes / 512 bytes
    Disklabel type: dos
    Disk identifier: 0x0b8b30c2

    Command (m for help): n
    Partition type
       p   primary (0 primary, 0 extended, 4 free)
       e   extended (container for logical partitions)
    Select (default p): p
    Partition number (1-4, default 1):
    First sector (2048-2097151, default 2048):
    Last sector, +/-sectors or +/-size{K,M,G,T,P} (2048-2097151, default 2097151): +100M

    Created a new partition 1 of type 'Linux' and of size 100 MiB.
    Partition #1 contains a xfs signature.

    Do you want to remove the signature? [Y]es/[N]o: yes

    The signature will be removed by a write command.

    Command (m for help): p
    Disk /dev/sdb: 1 GiB, 1073741824 bytes, 2097152 sectors
    Disk model: VBOX HARDDISK
    Units: sectors of 1 * 512 = 512 bytes
    Sector size (logical/physical): 512 bytes / 512 bytes
    I/O size (minimum/optimal): 512 bytes / 512 bytes
    Disklabel type: dos
    Disk identifier: 0x0b8b30c2

    Device     Boot Start    End Sectors  Size Id Type
    /dev/sdb1        2048 206847  204800  100M 83 Linux

    Filesystem/RAID signature on partition 1 will be wiped.

    Command (m for help): w
    The partition table has been altered.
    Calling ioctl() to re-read partition table.
    Syncing disks.

[root@desk ~]# partprobe

# Partition └─sdb1 created
[root@desk ~]# lsblk
    NAME        MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
    sda           8:0    0   10G  0 disk
    ├─sda1        8:1    0  500M  0 part /boot
    └─sda2        8:2    0  9.5G  0 part
      ├─cs-root 253:0    0  8.6G  0 lvm  /
      └─cs-swap 253:1    0  956M  0 lvm  [SWAP]
    sdb           8:16   0    1G  0 disk
    └─sdb1        8:17   0  100M  0 part
    sdc           8:32   0    1G  0 disk
    sdd           8:48   0    1G  0 disk
    sr0          11:0    1 1024M  0 rom

# Setting xfs file system to the partition /dev/sdb1
# Right after that the partition will be ready to be mounted
[root@desk ~]# mkfs.xfs /dev/sdb1
    Filesystem should be larger than 300MB.
    Log size should be at least 64MB.
    Support for filesystems like this one is deprecated and they will not be supported in future releases.
    meta-data=/dev/sdb1              isize=512    agcount=4, agsize=6400 blks
             =                       sectsz=512   attr=2, projid32bit=1
             =                       crc=1        finobt=1, sparse=1, rmapbt=0
             =                       reflink=1    bigtime=1 inobtcount=1 nrext64=0
    data     =                       bsize=4096   blocks=25600, imaxpct=25
             =                       sunit=0      swidth=0 blks
    naming   =version 2              bsize=4096   ascii-ci=0, ftype=1
    log      =internal log           bsize=4096   blocks=1368, version=2
             =                       sectsz=512   sunit=0 blks, lazy-count=1
    realtime =none                   extsz=4096   blocks=0, rtextents=0

# Create directory
# Mount the partition /dev/sdb1 to the created directory /examplesfs/xfs
# Create a file in /examplesfs/xfs for test
[root@desk ~]# mkdir -p /examplesfs/xfs
[root@desk ~]# mount /dev/sdb1 /examplesfs/xfs
[root@desk ~]# touch /examplefs/xfs/examplexfs
[root@desk ~]# ls -ltr /examplefs/xfs/examplexfs
    -rw-r--r--. 1 root root 0 Mar  2 18:58 /examplefs/xfs/examplexfs
[root@desk ~]# lsblk
    NAME        MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
    sda           8:0    0   10G  0 disk
    ├─sda1        8:1    0  500M  0 part /boot
    └─sda2        8:2    0  9.5G  0 part
      ├─cs-root 253:0    0  8.6G  0 lvm  /
      └─cs-swap 253:1    0  956M  0 lvm  [SWAP]
    sdb           8:16   0    1G  0 disk
    └─sdb1        8:17   0  100M  0 part /examplesfs/xfs
    sdc           8:32   0    1G  0 disk
    sdd           8:48   0    1G  0 disk
    sr0          11:0    1 1024M  0 rom

##############################################################################################################
#### Create a second MBR Partition in /dev/sdb with fdisk and change partition type to "Linux LVM"
[root@desk ~]# fdisk -l /dev/sdb
    Disk /dev/sdb: 1 GiB, 1073741824 bytes, 2097152 sectors
    Disk model: VBOX HARDDISK
    Units: sectors of 1 * 512 = 512 bytes
    Sector size (logical/physical): 512 bytes / 512 bytes
    I/O size (minimum/optimal): 512 bytes / 512 bytes
    Disklabel type: dos
    Disk identifier: 0x0b8b30c2

    Device     Boot Start    End Sectors  Size Id Type
    /dev/sdb1        2048 206847  204800  100M 83 Linux

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

    Device     Boot Start    End Sectors  Size Id Type
    /dev/sdb1        2048 206847  204800  100M 83 Linux

    Command (m for help): n
    Partition type
       p   primary (1 primary, 0 extended, 3 free)
       e   extended (container for logical partitions)
    Select (default p): p
    Partition number (2-4, default 2): 2
    First sector (206848-2097151, default 206848):
    Last sector, +/-sectors or +/-size{K,M,G,T,P} (206848-2097151, default 2097151): +200M

    Created a new partition 2 of type 'Linux' and of size 200 MiB.

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
    /dev/sdb2       206848 616447  409600  200M 83 Linux

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
    0f W95 Ext''d (LBA) 54 OnTrackDM6       a6 OpenBSD          ee GPT
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
    Disk identifier: 0x0b8b30c2

    Device     Boot  Start    End Sectors  Size Id Type
    /dev/sdb1         2048 206847  204800  100M 83 Linux
    /dev/sdb2       206848 616447  409600  200M 8e Linux LVM

    Command (m for help): w
    The partition table has been altered.
    Syncing disks.

[root@desk ~]# partprobe
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
    sdd           8:48   0    1G  0 disk
    sr0          11:0    1 1024M  0 rom

##############################################################################################################
#### Create a GPT Partition in /dev/sdc with gdisk
[root@desk ~]# gdisk /dev/sdc
    GPT fdisk (gdisk) version 1.0.7

    Partition table scan:
      MBR: protective
      BSD: not present
      APM: not present
      GPT: present

    Found valid GPT with protective MBR; using GPT.

    Command (? for help): n
    Partition number (1-128, default 1):
    First sector (34-2097118, default = 2048) or {+-}size{KMGTP}:
    Last sector (2048-2097118, default = 2097118) or {+-}size{KMGTP}: +100M
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
    Total free space is 1892285 sectors (924.0 MiB)

    Number  Start (sector)    End (sector)  Size       Code  Name
       1            2048          206847   100.0 MiB   8300  Linux filesystem

    Command (? for help): w

    Final checks complete. About to write GPT data. THIS WILL OVERWRITE EXISTING
    PARTITIONS!!

    Do you want to proceed? (Y/N): y
    OK; writing new GUID partition table (GPT) to /dev/sdc.
    The operation has completed successfully.
[root@desk ~]# partprobe
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
#### Final Validations
# gdisk -l /dev/sdb -> MBR only
# gdisk -l /dev/sdc -> GPT PRESENT
[root@desk ~]# gdisk -l /dev/sdb
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

    Disk /dev/sdb: 2097152 sectors, 1024.0 MiB
    Model: VBOX HARDDISK
    Sector size (logical/physical): 512/512 bytes
    Disk identifier (GUID): 351F1D21-3BEB-4C78-9201-31D95027CF13
    Partition table holds up to 128 entries
    Main partition table begins at sector 2 and ends at sector 33
    First usable sector is 34, last usable sector is 2097118
    Partitions will be aligned on 2048-sector boundaries
    Total free space is 1482685 sectors (724.0 MiB)

    Number  Start (sector)    End (sector)  Size       Code  Name
       1            2048          206847   100.0 MiB   8300  Linux filesystem
       2          206848          616447   200.0 MiB   8E00  Linux LVM

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
    Total free space is 1892285 sectors (924.0 MiB)

    Number  Start (sector)    End (sector)  Size       Code  Name
       1            2048          206847   100.0 MiB   8300  Linux filesystem
















































































































































