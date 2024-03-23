# Crie 5 partições de 200M no seu disco de 1 GB. 3 partições com rótulo de LVM e 2 com rótulo de SWAP.

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
[root@dev1 ~]# gdisk /dev/sdb
    GPT fdisk (gdisk) version 1.0.7

    Partition table scan:
      MBR: not present
      BSD: not present
      APM: not present
      GPT: not present

    Creating new GPT entries in memory.

    Command (? for help): n
    Partition number (1-128, default 1): 1
    First sector (34-2097118, default = 2048) or {+-}size{KMGTP}:
    Last sector (2048-2097118, default = 2097118) or {+-}size{KMGTP}: +200M
    Current type is 8300 (Linux filesystem)
    Hex code or GUID (L to show codes, Enter = 8300): l
    Type search string, or <Enter> to show all codes:
    0700 Microsoft basic data                0701 Microsoft Storage Replica
    0702 ArcaOS Type 1                       0c01 Microsoft reserved
    2700 Windows RE                          3000 ONIE boot
    3001 ONIE config                         3900 Plan 9
    4100 PowerPC PReP boot                   4200 Windows LDM data
    4201 Windows LDM metadata                4202 Windows Storage Spaces
    7501 IBM GPFS                            7f00 ChromeOS kernel
    7f01 ChromeOS root                       7f02 ChromeOS reserved
    8200 Linux swap                          8300 Linux filesystem
    8301 Linux reserved                      8302 Linux /home
    8303 Linux x86 root (/)                  8304 Linux x86-64 root (/)
    8305 Linux ARM64 root (/)                8306 Linux /srv
    8307 Linux ARM32 root (/)                8308 Linux dm-crypt
    8309 Linux LUKS                          830a Linux IA-64 root (/)
    830b Linux x86 root verity               830c Linux x86-64 root verity
    830d Linux ARM32 root verity             830e Linux ARM64 root verity
    830f Linux IA-64 root verity             8310 Linux /var
    8311 Linux /var/tmp                      8312 Linux user''s home
    8313 Linux x86 /usr                      8314 Linux x86-64 /usr
    8315 Linux ARM32 /usr                    8316 Linux ARM64 /usr
    8317 Linux IA-64 /usr                    8318 Linux x86 /usr verity
    Press the <Enter> key to see more codes, q to quit:
    8319 Linux x86-64 /usr verity            831a Linux ARM32 /usr verity
    831b Linux ARM64 /usr verity             831c Linux IA-64 /usr verity
    8400 Intel Rapid Start                   8401 SPDK block device
    8500 Container Linux /usr                8501 Container Linux resizable rootfs
    8502 Container Linux /OEM customization  8503 Container Linux root on RAID
    8e00 Linux LVM                           a000 Android bootloader
    a001 Android bootloader 2                a002 Android boot 1
    a003 Android recovery 1                  a004 Android misc
    a005 Android metadata                    a006 Android system 1
    a007 Android cache                       a008 Android data
    a009 Android persistent                  a00a Android factory
    a00b Android fastboot/tertiary           a00c Android OEM
    a00d Android vendor                      a00e Android config
    a00f Android factory (alt)               a010 Android meta
    a011 Android EXT                         a012 Android SBL1
    a013 Android SBL2                        a014 Android SBL3
    a015 Android APPSBL                      a016 Android QSEE/tz
    a017 Android QHEE/hyp                    a018 Android RPM
    a019 Android WDOG debug/sdi              a01a Android DDR
    a01b Android CDT                         a01c Android RAM dump
    a01d Android SEC                         a01e Android PMIC
    Press the <Enter> key to see more codes, q to quit:
    a01f Android misc 1                      a020 Android misc 2
    a021 Android device info                 a022 Android APDP
    a023 Android MSADP                       a024 Android DPO
    a025 Android recovery 2                  a026 Android persist
    a027 Android modem ST1                   a028 Android modem ST2
    a029 Android FSC                         a02a Android FSG 1
    a02b Android FSG 2                       a02c Android SSD
    a02d Android keystore                    a02e Android encrypt
    a02f Android EKSST                       a030 Android RCT
    a031 Android spare1                      a032 Android spare2
    a033 Android spare3                      a034 Android spare4
    a035 Android raw resources               a036 Android boot 2
    a037 Android FOTA                        a038 Android system 2
    a039 Android cache                       a03a Android user data
    a03b LG (Android) advanced flasher       a03c Android PG1FS
    a03d Android PG2FS                       a03e Android board info
    a03f Android MFG                         a040 Android limits
    a200 Atari TOS basic data                a500 FreeBSD disklabel
    a501 FreeBSD boot                        a502 FreeBSD swap
    a503 FreeBSD UFS                         a504 FreeBSD ZFS
    a505 FreeBSD Vinum/RAID                  a580 Midnight BSD data
    Press the <Enter> key to see more codes, q to quit: 8e00
    a581 Midnight BSD boot                   a582 Midnight BSD swap
    a583 Midnight BSD UFS                    a584 Midnight BSD ZFS
    a585 Midnight BSD Vinum                  a600 OpenBSD disklabel
    a800 Apple UFS                           a901 NetBSD swap
    a902 NetBSD FFS                          a903 NetBSD LFS
    a904 NetBSD concatenated                 a905 NetBSD encrypted
    a906 NetBSD RAID                         ab00 Recovery HD
    af00 Apple HFS/HFS+                      af01 Apple RAID
    af02 Apple RAID offline                  af03 Apple label
    af04 AppleTV recovery                    af05 Apple Core Storage
    af06 Apple SoftRAID Status               af07 Apple SoftRAID Scratch
    af08 Apple SoftRAID Volume               af09 Apple SoftRAID Cache
    af0a Apple APFS                          b300 QNX6 Power-Safe
    bc00 Acronis Secure Zone                 be00 Solaris boot
    bf00 Solaris root                        bf01 Solaris /usr & Mac ZFS
    bf02 Solaris swap                        bf03 Solaris backup
    bf04 Solaris /var                        bf05 Solaris /home
    bf06 Solaris alternate sector            bf07 Solaris Reserved 1
    bf08 Solaris Reserved 2                  bf09 Solaris Reserved 3
    bf0a Solaris Reserved 4                  bf0b Solaris Reserved 5
    c001 HP-UX data                          c002 HP-UX service
    Press the <Enter> key to see more codes, q to quit:
    e100 ONIE boot                           e101 ONIE config
    e900 Veracrypt data                      ea00 XBOOTLDR partition
    eb00 Haiku BFS                           ed00 Sony system partition
    ed01 Lenovo system partition             ef00 EFI system partition
    ef01 MBR partition scheme                ef02 BIOS boot partition
    f800 Ceph OSD                            f801 Ceph dm-crypt OSD
    f802 Ceph journal                        f803 Ceph dm-crypt journal
    f804 Ceph disk in creation               f805 Ceph dm-crypt disk in creation
    f806 Ceph block                          f807 Ceph block DB
    f808 Ceph block write-ahead log          f809 Ceph lockbox for dm-crypt keys
    f80a Ceph multipath OSD                  f80b Ceph multipath journal
    f80c Ceph multipath block 1              f80d Ceph multipath block 2
    f80e Ceph multipath block DB             f80f Ceph multipath block write-ahead l
    f810 Ceph dm-crypt block                 f811 Ceph dm-crypt block DB
    f812 Ceph dm-crypt block write-ahead lo  f813 Ceph dm-crypt LUKS journal
    f814 Ceph dm-crypt LUKS block            f815 Ceph dm-crypt LUKS block DB
    f816 Ceph dm-crypt LUKS block write-ahe  f817 Ceph dm-crypt LUKS OSD
    fb00 VMWare VMFS                         fb01 VMWare reserved
    fc00 VMWare kcore crash protection       fd00 Linux RAID
    Hex code or GUID (L to show codes, Enter = 8300): 8e00
    Changed type of partition to 'Linux LVM'

    Command (? for help): n
    Partition number (2-128, default 2):
    First sector (34-2097118, default = 411648) or {+-}size{KMGTP}:
    Last sector (411648-2097118, default = 2097118) or {+-}size{KMGTP}: +200M
    Current type is 8300 (Linux filesystem)
    Hex code or GUID (L to show codes, Enter = 8300): 8e00
    Changed type of partition to 'Linux LVM'

    Command (? for help): n
    Partition number (3-128, default 3): 3
    First sector (34-2097118, default = 821248) or {+-}size{KMGTP}:
    Last sector (821248-2097118, default = 2097118) or {+-}size{KMGTP}: +200M
    Current type is 8300 (Linux filesystem)
    Hex code or GUID (L to show codes, Enter = 8300): 8e00
    Changed type of partition to 'Linux LVM'

    Command (? for help): n
    Partition number (4-128, default 4):
    First sector (34-2097118, default = 1230848) or {+-}size{KMGTP}:
    Last sector (1230848-2097118, default = 2097118) or {+-}size{KMGTP}: +200M
    Current type is 8300 (Linux filesystem)
    Hex code or GUID (L to show codes, Enter = 8300): 8200
    Changed type of partition to 'Linux swap'

    Command (? for help): n
    Partition number (5-128, default 5):
    First sector (34-2097118, default = 1640448) or {+-}size{KMGTP}:
    Last sector (1640448-2097118, default = 2097118) or {+-}size{KMGTP}: +200M
    Current type is 8300 (Linux filesystem)
    Hex code or GUID (L to show codes, Enter = 8300): 8200
    Changed type of partition to 'Linux swap'

    Command (? for help): w

    Final checks complete. About to write GPT data. THIS WILL OVERWRITE EXISTING
    PARTITIONS!!

    Do you want to proceed? (Y/N): y
    OK; writing new GUID partition table (GPT) to /dev/sdb.
    The operation has completed successfully.
# 
[root@dev1 ~]# partprobe
[root@dev1 ~]# lsblk
    NAME        MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
    sda           8:0    0   10G  0 disk
    ├─sda1        8:1    0  500M  0 part /boot
    └─sda2        8:2    0  9.5G  0 part
      ├─cs-root 253:0    0  8.6G  0 lvm  /
      └─cs-swap 253:1    0  956M  0 lvm  [SWAP]
    sdb           8:16   0    1G  0 disk
    ├─sdb1        8:17   0  200M  0 part
    ├─sdb2        8:18   0  200M  0 part
    ├─sdb3        8:19   0  200M  0 part
    ├─sdb4        8:20   0  200M  0 part
    └─sdb5        8:21   0  200M  0 part
    sdc           8:32   0    1G  0 disk
    sdd           8:48   0    1G  0 disk
    sr0          11:0    1 1024M  0 rom
[root@dev1 ~]# gdisk -l /dev/sdb
    GPT fdisk (gdisk) version 1.0.7

    Partition table scan:
      MBR: protective
      BSD: not present
      APM: not present
      GPT: present

    Found valid GPT with protective MBR; using GPT.
    Disk /dev/sdb: 2097152 sectors, 1024.0 MiB
    Model: VBOX HARDDISK
    Sector size (logical/physical): 512/512 bytes
    Disk identifier (GUID): 066C785C-C06C-4038-9F81-A6A4C7283752
    Partition table holds up to 128 entries
    Main partition table begins at sector 2 and ends at sector 33
    First usable sector is 34, last usable sector is 2097118
    Partitions will be aligned on 2048-sector boundaries
    Total free space is 49085 sectors (24.0 MiB)

    Number  Start (sector)    End (sector)  Size       Code  Name
       1            2048          411647   200.0 MiB   8E00  Linux LVM
       2          411648          821247   200.0 MiB   8E00  Linux LVM
       3          821248         1230847   200.0 MiB   8E00  Linux LVM
       4         1230848         1640447   200.0 MiB   8200  Linux swap
       5         1640448         2050047   200.0 MiB   8200  Linux swap

[root@dev1 ~]# lsblk -fi
    NAME      FSTYPE      FSVER    LABEL UUID                                   FSAVAIL FSUSE% MOUNTPOINTS
    sda
    |-sda1    xfs                        c07b4e4a-9aa8-4f51-a653-d0fb026dd2fc    142.9M    67% /boot
    `-sda2    LVM2_member LVM2 001       01r8N3-pKgY-bHbi-xVRa-n838-Ktei-7mbyqj
      |-cs-root
      |       xfs                        7b2c3470-0adc-4323-86bf-24c20411df68      3.9G    54% /
      `-cs-swap
              swap        1              870fa721-5a7a-4289-9658-a03e88ae5a28                  [SWAP]
    sdb
    |-sdb1
    |-sdb2
    |-sdb3
    |-sdb4
    `-sdb5
    sdc
    sdd
    sr0





























