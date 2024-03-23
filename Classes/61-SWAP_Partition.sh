##############################################################################################################
#### Discovery 
# Check all SWAP 
[root@desk ~]# swapon -s
    Filename                                Type            Size            Used            Priority
    /dev/dm-1                               partition       978940          0               -2
# Check total SWAP
[root@desk ~]# free -m
                   total        used        free      shared  buff/cache   available
    Mem:            1751         749         694           7         465        1001
    Swap:            955           0         955
# SWAP memory can also be found in top command, MiB Swap.
[root@desk ~]# top
    top - 21:23:45 up  3:41,  1 user,  load average: 0.00, 0.00, 0.00
    Tasks: 198 total,   1 running, 197 sleeping,   0 stopped,   0 zombie
    %Cpu(s):  0.0 us,  0.0 sy,  0.0 ni, 99.7 id,  0.0 wa,  0.0 hi,  0.3 si,  0.0 st
    MiB Mem :   1751.7 total,    694.8 free,    749.9 used,    465.9 buff/cache
    MiB Swap:    956.0 total,    956.0 free,      0.0 used.   1001.9 avail Mem

        PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
       1080 apache    20   0 1079948  11420   5888 S   0.3   0.6   0:02.92 httpd
       5716 root      20   0       0      0      0 I   0.3   0.0   0:00.94 kworker/u2:0-events_unbound
          1 root      20   0  107748  16808  10708 S   0.0   0.9   0:01.82 systemd
          2 root      20   0       0      0      0 S   0.0   0.0   0:00.00 kthreadd

##############################################################################################################
#### Task 
# Create partition /dev/sdd1 as SWAP
# Create partition /dev/sdd2 as Linux LVM

# Add Partition /dev/sdd1 to SWAP Memory and turn it on
# Add /dev/sdd1 to SWAP Memory and turn it on

# Create a Physical Volume to /dev/sdd2
# Create a Volume Group named MYSWAP
# Attach /dev/sdd2 Physical Volume to MYSWAP Volume Group 
# Create a Logical Volume from MYSWAP Volume Group and name it as mymemswap
# Format mymemswap Logical Volume with mkswap
# Turn mymemswap SWAP Logical Volume on

# Add the new entries to /etc/fstab so they can be initialized during boot

# /dev/sdd1
[root@desk ~]# fdisk /dev/sdd

    Welcome to fdisk (util-linux 2.37.4).
    Changes will remain in memory only, until you decide to write them.
    Be careful before using the write command.

    This disk is currently in use - repartitioning is probably a bad idea.
    It''s recommended to umount all file systems, and swapoff all swap
    partitions on this disk.


    Device does not contain a recognized partition table.
    Created a new DOS disklabel with disk identifier 0x0f72d6e6.

    Command (m for help): p
        Disk /dev/sdd: 1 GiB, 1073741824 bytes, 2097152 sectors
        Disk model: VBOX HARDDISK
        Units: sectors of 1 * 512 = 512 bytes
        Sector size (logical/physical): 512 bytes / 512 bytes
        I/O size (minimum/optimal): 512 bytes / 512 bytes
        Disklabel type: dos
        Disk identifier: 0x0f72d6e6
    Command (m for help): n
        Partition type
        p   primary (0 primary, 0 extended, 4 free)
        e   extended (container for logical partitions)
        Select (default p): p
        Partition number (1-4, default 1): 1
        First sector (2048-2097151, default 2048):
        Last sector, +/-sectors or +/-size{K,M,G,T,P} (2048-2097151, default 2097151): +200M

        Created a new partition 1 of type 'Linux' and of size 200 MiB.

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
        Selected partition 1
        Hex code or alias (type L to list all): 82
        Changed type of partition 'Linux' to 'Linux swap / Solaris'.

    Command (m for help): p
        Disk /dev/sdd: 1 GiB, 1073741824 bytes, 2097152 sectors
        Disk model: VBOX HARDDISK
        Units: sectors of 1 * 512 = 512 bytes
        Sector size (logical/physical): 512 bytes / 512 bytes
        I/O size (minimum/optimal): 512 bytes / 512 bytes
        Disklabel type: dos
        Disk identifier: 0x0f72d6e6

        Device     Boot Start    End Sectors  Size Id Type
        /dev/sdd1        2048 411647  409600  200M 82 Linux swap / Solaris

    Command (m for help): n
        Partition type
           p   primary (1 primary, 0 extended, 3 free)
           e   extended (container for logical partitions)
        Select (default p): p
        Partition number (2-4, default 2): 2
        First sector (411648-2097151, default 411648):
        Last sector, +/-sectors or +/-size{K,M,G,T,P} (411648-2097151, default 2097151): +200M

        Created a new partition 2 of type 'Linux' and of size 200 MiB.

        Command (m for help): t
        Partition number (1,2, default 2): 2
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

        Device     Boot  Start    End Sectors  Size Id Type
        /dev/sdd1         2048 411647  409600  200M 82 Linux swap / Solaris
        /dev/sdd2       411648 821247  409600  200M 8e Linux LVM

        Command (m for help): w
        The partition table has been altered.
        Syncing disks.

[root@desk ~]# partprobe
# You may need reboot if get error messages of busy partition or file
[root@desk ~]# reboot
[root@desk ~]# mkswap /dev/sdd1
    Setting up swapspace version 1, size = 200 MiB (209711104 bytes)
    no label, UUID=7e1fcdba-9c76-48fe-995d-a5a25f91f4d3
[root@desk ~]# swapon /dev/sdd1
# Note that /dev/sdd1 was added as SWAP Partition
[root@desk ~]# swapon -s
    Filename                                Type            Size            Used            Priority
    /dev/dm-1                               partition       978940          0               -2
    /dev/sdd1                               partition       204796          0               -3
# The amount of SWAP total memory was increased by 200M, /dev/sdd1 size.
[root@desk ~]# free -m
                   total        used        free      shared  buff/cache   available
    Mem:            1751         715         749           7         441        1036
    Swap:           1155           0        1155
#

# /dev/sdd2
[root@desk ~]# vgs
  VG         #PV #LV #SN Attr   VSize   VFree
  cs           1   2   0 wz--n-  <9.51g     0
  example_vg   2   2   0 wz--n- 392.00m 92.00m
[root@desk ~]# pvs
  PV         VG         Fmt  Attr PSize   PFree
  /dev/sda2  cs         lvm2 a--   <9.51g     0
  /dev/sdb2  example_vg lvm2 a--  196.00m 92.00m
  /dev/sdb5  example_vg lvm2 a--  196.00m     0
# /dev/sdd2 Physical Volume Created
[root@desk ~]# pvcreate /dev/sdd2
  Physical volume "/dev/sdd2" successfully created.

[root@desk ~]# pvs
  PV         VG         Fmt  Attr PSize   PFree
  /dev/sda2  cs         lvm2 a--   <9.51g      0
  /dev/sdb2  example_vg lvm2 a--  196.00m  92.00m
  /dev/sdb5  example_vg lvm2 a--  196.00m      0
  /dev/sdd2             lvm2 ---  200.00m 200.00m
  
# MYSWAP Volume Group Created
# /dev/sdd2 Physical Volume attached to MYSWAP Volume Group
[root@desk ~]# vgcreate MYSWAP /dev/sdd2
  Volume group "MYSWAP" successfully created

[root@desk ~]# vgs
  VG         #PV #LV #SN Attr   VSize   VFree
  MYSWAP       1   0   0 wz--n- 196.00m 196.00m
  cs           1   2   0 wz--n-  <9.51g      0
  example_vg   2   2   0 wz--n- 392.00m  92.00m

[root@desk ~]# pvs
  PV         VG         Fmt  Attr PSize   PFree
  /dev/sda2  cs         lvm2 a--   <9.51g      0
  /dev/sdb2  example_vg lvm2 a--  196.00m  92.00m
  /dev/sdb5  example_vg lvm2 a--  196.00m      0
  /dev/sdd2  MYSWAP     lvm2 a--  196.00m 196.00m

[root@desk ~]# vgdisplay MYSWAP
  --- Volume group ---
  VG Name               MYSWAP
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
  VG UUID               8frGgT-smcO-x843-DbVe-Kf2u-ekME-beUJep

[root@desk ~]# lvcreate -l 49 -n mymemswap MYSWAP
  Logical volume "mymemswap" created.
[root@desk ~]# lvs
    LV        VG         Attr       LSize   Pool Origin Data%  Meta%  Move Log Cpy%Sync Convert
    mymemswap MYSWAP     -wi-a----- 196.00m
    root      cs         -wi-ao----   8.57g
    swap      cs         -wi-ao---- 956.00m
    mylv1     example_vg -wi-ao---- 100.00m
    mylv2     example_vg -wi-ao---- 200.00m
# /dev/MYSWAP/mymemswap formatted as SWAP
[root@desk ~]#  mkswap /dev/MYSWAP/mymemswap
    Setting up swapspace version 1, size = 196 MiB (205516800 bytes)
    no label, UUID=e8a6d51c-d1d9-42d2-90da-627881b58867
    [root@desk ~]# swapon /dev/MYSWAP/mymemswap
    [root@desk ~]# swapon -s
    Filename                                Type            Size            Used            Priority
    /dev/dm-1                               partition       978940          0               -2
    /dev/sdd1                               partition       204796          0               -3
    /dev/dm-4                               partition       200700          0               -4
[root@desk ~]# free -m
                   total        used        free      shared  buff/cache   available
    Mem:            1751         713         703           7         490        1038
    Swap:           1351           0        1351
# 

# /etc/fstab
[root@desk ~]# cat /etc/fstab
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
    #/dev/example_vg/mylv1   /examplesfs/xfs xfs     defaults        0       0
    /dev/example_vg/mylv2   /examplesfs/ext4        ext4    defaults        0       0
    LABEL=myxfs     /examplesfs/labels/xfs  xfs     defaults        0       0
    LABEL=myext4    /examplesfs/labels/ext4 ext4    defaults        0       0
    UUID=d0b74b57-e85f-47c5-b998-1d360bc05677       /examplesfs/xfs xfs     defaults        0       0


[root@desk ~]# vi /etc/fstab
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
    #/dev/example_vg/mylv1   /examplesfs/xfs xfs     defaults        0       0
    /dev/example_vg/mylv2   /examplesfs/ext4        ext4    defaults        0       0
    LABEL=myxfs     /examplesfs/labels/xfs  xfs     defaults        0       0
    LABEL=myext4    /examplesfs/labels/ext4 ext4    defaults        0       0
    UUID=d0b74b57-e85f-47c5-b998-1d360bc05677       /examplesfs/xfs xfs     defaults        0       0
    /dev/sdd1       swap    swap    defaults        0       0
    /dev/MYSWAP/mymemswap   swap    swap    defaults        0       0
[root@desk ~]# reboot
# Partion /dev/sdd1 still mounted as SWAP after reboot
# Logical Volume /dev/MYSWAP/mymemswap still mounted as SWAP after reboot
[root@desk ~]# lsblk -fi
    NAME     FSTYPE FSVER LABEL UUID                                   FSAVAIL FSUSE% MOUNTPOINTS
    sda
    |-sda1   xfs                c07b4e4a-9aa8-4f51-a653-d0fb026dd2fc    142.9M    67% /boot
    `-sda2   LVM2_m LVM2        01r8N3-pKgY-bHbi-xVRa-n838-Ktei-7mbyqj
      |-cs-root
      |      xfs                7b2c3470-0adc-4323-86bf-24c20411df68      3.7G    57% /
      `-cs-swap
             swap   1           870fa721-5a7a-4289-9658-a03e88ae5a28                  [SWAP]
    sdb
    |-sdb1   xfs                318c5565-1e4f-42d9-8535-8afbe0013644
    |-sdb2   LVM2_m LVM2        cd9iEW-DBZg-bneP-jKy6-AcKx-5ZU9-nNO1Mb
    | |-example_vg-mylv1
    | |      xfs                d0b74b57-e85f-47c5-b998-1d360bc05677     88.7M     6% /examplesfs/xfs
    | `-example_vg-mylv2
    |        ext4   1.0         7f416bc5-2122-47a0-9804-109b9f82c724    167.9M     0% /examplesfs/ext4
    |-sdb4
    `-sdb5   LVM2_m LVM2        fyLCtR-dnrj-TsCB-31Tv-1jds-rIeG-q7gBE8
      `-example_vg-mylv2
             ext4   1.0         7f416bc5-2122-47a0-9804-109b9f82c724    167.9M     0% /examplesfs/ext4
    sdc
    |-sdc1   xfs          myxfs b023b2e4-c7c0-40b5-ab83-5e8c47957035     88.7M     6% /examplesfs/labels/xfs
    `-sdc2   ext4   1.0   myext4
                                c9f54bae-9eb6-4301-9064-ae2388529ac1     81.2M     0% /examplesfs/labels/ext4
    sdd
    |-sdd1   swap   1           7e1fcdba-9c76-48fe-995d-a5a25f91f4d3                  [SWAP]
    `-sdd2   LVM2_m LVM2        HQwfcM-hPu9-H0pf-Tbxs-ve0t-PNB0-v8ojZV
      `-MYSWAP-mymemswap
             swap   1           e8a6d51c-d1d9-42d2-90da-627881b58867                  [SWAP]
    sr0
[root@desk ~]# free -m
                   total        used        free      shared  buff/cache   available
    Mem:            1751         723         729           7         457        1028
    Swap:           1351           0        1351