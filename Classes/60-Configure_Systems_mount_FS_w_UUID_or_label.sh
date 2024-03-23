##############################################################################################################
#### Discovery
# File used to automatically mount file system on Linux
# !!! Careful in case of errors the system may not properly
# Columns name
# DEVICE NAME                               | DESTINY   | FS Type    | Mount     | DUMP SUPPORT | AUTO CHECK
# /dev/mapper/cs-root                       | /         |   xfs      | defaults  | 0            | 0     
# UUID=c07b4e4a-9aa8-4f51-a653-d0fb026dd2fc | /boot     |   xfs      | defaults  | 0            | 0
# /dev/mapper/cs-swap                       | none      |   swap     | defaults  | 0            | 0    
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

# Get UUID
[root@desk ~]# lsblk -fi
    NAME        FSTYPE    FSVER    LABEL UUID                                   FSAVAIL FSUSE% MOUNTPOINTS
    sda
    |-sda1      xfs                      c07b4e4a-9aa8-4f51-a653-d0fb026dd2fc    142.9M    67% /boot
    `-sda2      LVM2_memb LVM2 001       01r8N3-pKgY-bHbi-xVRa-n838-Ktei-7mbyqj
      |-cs-root xfs                      7b2c3470-0adc-4323-86bf-24c20411df68      3.7G    57% /
      `-cs-swap swap      1              870fa721-5a7a-4289-9658-a03e88ae5a28                  [SWAP]
    sdb
    |-sdb1      xfs                      318c5565-1e4f-42d9-8535-8afbe0013644
    |-sdb2      LVM2_memb LVM2 001       cd9iEW-DBZg-bneP-jKy6-AcKx-5ZU9-nNO1Mb
    | `-example_vg-mylv1
    |           xfs                      d0b74b57-e85f-47c5-b998-1d360bc05677
    |-sdb4
    `-sdb5      LVM2_memb LVM2 001       fyLCtR-dnrj-TsCB-31Tv-1jds-rIeG-q7gBE8
    sdc
    ``-sdc1      xfs                myxfs d1d265db-fdb2-4441-ae01-a050c0adc359
    sdd
    sr0
# Another way of Get UUID
[root@desk ~]# blkid /dev/example_vg/mylv1
    /dev/example_vg/mylv1: UUID="d0b74b57-e85f-47c5-b998-1d360bc05677" TYPE="xfs"

##############################################################################################################
#### Create more Logical Volumes and Mount them with /etc/fstab
# Create Logical Volume /dev/example_vg/mylv1
# Format Logical Volume /dev/example_vg/mylv1 as ext4
# Create directory /examplesfs/ext4 to mount /dev/example_vg/mylv1
# Automatically mount the Logical Volumes below in /etc/fstab
    # /dev/example_vg/mylv1 on /examplesfs/xfs
    # /dev/example_vg/mylv2 on /examplesfs/ext4

# Check example_vg
[root@desk ~]# vgs
  VG         #PV #LV #SN Attr   VSize   VFree
  cs           1   2   0 wz--n-  <9.51g      0
  example_vg   2   1   0 wz--n- 392.00m 292.00m

# Check Logical Volumes that were already created from Volume Group example_vg
[root@desk ~]# lvs
  LV    VG         Attr       LSize   Pool Origin Data%  Meta%  Move Log Cpy%Sync Convert
  root  cs         -wi-ao----   8.57g
  swap  cs         -wi-ao---- 956.00m
  mylv1 example_vg -wi-a----- 100.00m

# Check free space on Volume Group example_vg
[root@desk ~]# vgdisplay example_vg
  --- Volume group ---
  VG Name               example_vg
  System ID
  Format                lvm2
  Metadata Areas        2
  Metadata Sequence No  5
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
  Alloc PE / Size       25 / 100.00 MiB
  Free  PE / Size       73 / 292.00 MiB
  VG UUID               Zo494O-dOMq-3Myw-ZRdQ-aDdn-vhIi-fpaHpX

# Create a Logical Volume with 50 PE(Physical Extensions)
# Option -l means that LV will be created by : PE Size x the parameter after -l = 4 X 50
# A 200MB LV will be created
[root@desk ~]# lvcreate -l 50 -n mylv2 example_vg
  Logical volume "mylv2" created.
# A 200MB LV mylv2 was created
[root@desk ~]# lvs
  LV    VG         Attr       LSize   Pool Origin Data%  Meta%  Move Log Cpy%Sync Convert
  root  cs         -wi-ao----   8.57g
  swap  cs         -wi-ao---- 956.00m
  mylv1 example_vg -wi-a----- 100.00m
  mylv2 example_vg -wi-a----- 200.00m
# Format /dev/example_vg/mylv2 with ext4 file system format
[root@desk ~]# mkfs.ext4 /dev/example_vg/mylv2
    mke2fs 1.46.5 (30-Dec-2021)
    Creating filesystem with 204800 1k blocks and 51200 inodes
    Filesystem UUID: e2acd4e3-fe74-4af0-9ebb-c35d7e4434f1
    Superblock backups stored on blocks:
            8193, 24577, 40961, 57345, 73729

    Allocating group tables: done
    Writing inode tables: done
    Creating journal (4096 blocks): done
    Writing superblocks and filesystem accounting information: done
# example_vg-mylv2 will show up under sdb2 and sdb5 because both are part of Volume Group example_vg
[root@desk ~]# lsblk -fi
    NAME        FSTYPE    FSVER    LABEL UUID                                   FSAVAIL FSUSE% MOUNTPOINTS
    sda
    |-sda1      xfs                      c07b4e4a-9aa8-4f51-a653-d0fb026dd2fc    142.9M    67% /boot
    `-sda2      LVM2_memb LVM2 001       01r8N3-pKgY-bHbi-xVRa-n838-Ktei-7mbyqj
      |-cs-root xfs                      7b2c3470-0adc-4323-86bf-24c20411df68      3.7G    57% /
      `-cs-swap swap      1              870fa721-5a7a-4289-9658-a03e88ae5a28                  [SWAP]
    sdb
    |-sdb1      xfs                      318c5565-1e4f-42d9-8535-8afbe0013644
    |-sdb2      LVM2_memb LVM2 001       cd9iEW-DBZg-bneP-jKy6-AcKx-5ZU9-nNO1Mb
    | |-example_vg-mylv1
    | |         xfs                      d0b74b57-e85f-47c5-b998-1d360bc05677
    | `-example_vg-mylv2
    |           ext4      1.0            e2acd4e3-fe74-4af0-9ebb-c35d7e4434f1
    |-sdb4
    `-sdb5      LVM2_memb LVM2 001       fyLCtR-dnrj-TsCB-31Tv-1jds-rIeG-q7gBE8
      `-example_vg-mylv2
                ext4      1.0            e2acd4e3-fe74-4af0-9ebb-c35d7e4434f1
    sdc
    `-sdc1      xfs                myxfs d1d265db-fdb2-4441-ae01-a050c0adc359
    sdd
    sr0
# Check directory to create a folder to mount the recently create Logical Volume dev/example_vg/mylv2
[root@desk ~]# ls /examplesfs/
    xfs
# Create directory ext4 to mount the Logical Volume dev/example_vg/mylv2
[root@desk ~]# mkdir /examplesfs/ext4
# Directory Created 
[root@desk ~]# ls /examplesfs/    
    ext4  xfs

#### Review /etc/fstab to automatically mount Logical Volumes on Boot
# Check /etc/fstab  before editing it
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

# Add the two logical volumes by name to /etc/fstab
# /dev/example_vg/mylv1   /examplesfs/xfs xfs     defaults        0       0
# /dev/example_vg/mylv2   /examplesfs/ext4        ext4    defaults        0       0   
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
    /dev/example_vg/mylv1   /examplesfs/xfs xfs     defaults        0       0
    /dev/example_vg/mylv2   /examplesfs/ext4        ext4    defaults        0       0    
# Run the mount -a to mount
[root@desk ~]# mount -a
    mount: (hint) your fstab has been modified, but systemd still uses
           the old version; use 'systemctl daemon-reload' to reload.
# Check results on lsblk -fi
# Note that /dev/example/mylv1 was already mounted
# but /dev/example/mylv2 under sdb2 and sd5 is now mounted on /examplesfs/ext4
[root@desk ~]#  lsblk -fi
    NAME        FSTYPE FSVER  LABEL UUID                                   FSAVAIL FSUSE% MOUNTPOINTS
    sda
    |-sda1      xfs                 c07b4e4a-9aa8-4f51-a653-d0fb026dd2fc    142.9M    67% /boot
    `-sda2      LVM2_m LVM2 0       01r8N3-pKgY-bHbi-xVRa-n838-Ktei-7mbyqj
      |-cs-root xfs                 7b2c3470-0adc-4323-86bf-24c20411df68      3.7G    57% /
      `-cs-swap swap   1            870fa721-5a7a-4289-9658-a03e88ae5a28                  [SWAP]
    sdb
    |-sdb1      xfs                 318c5565-1e4f-42d9-8535-8afbe0013644
    |-sdb2      LVM2_m LVM2 0       cd9iEW-DBZg-bneP-jKy6-AcKx-5ZU9-nNO1Mb
    | |-example_vg-mylv1
    | |         xfs                 d0b74b57-e85f-47c5-b998-1d360bc05677     88.7M     6% /examplesfs/xfs
    | `-example_vg-mylv2
    |           ext4   1.0          e2acd4e3-fe74-4af0-9ebb-c35d7e4434f1    167.9M     0% /examplesfs/ext4
    |-sdb4
    `-sdb5      LVM2_m LVM2 0       fyLCtR-dnrj-TsCB-31Tv-1jds-rIeG-q7gBE8
      `-example_vg-mylv2
                ext4   1.0          e2acd4e3-fe74-4af0-9ebb-c35d7e4434f1    167.9M     0% /examplesfs/ext4
    sdc
    `-sdc1      xfs           myxfs d1d265db-fdb2-4441-ae01-a050c0adc359
    sdd
    sr0
#


##############################################################################################################
#### Create Partitions, Add Label and Mount them in /etc/fstab by label and UUID
# Create partition /dev/sdc1
# Create partition /dev/sdc2
# Format /dev/sdc1 as xfs
# Format /dev/sdc2 as ext4
# Create folder /examplesfs/labels/xfs  to mount /dev/sdc1
# Create folder /examplesfs/labels/ext4 to mount /dev/sdc2
# Add labels to /dev/sdc1 and /dev/sdc2 as myxfs and myext4
# Using their Labels, Add partitions /dev/sdc1 and /dev/sdc2 to the /etc/fstab
# Review /etc/fstab to use the UUID of the Logical Volume /dev/example_vg/mylv1 instead of his name ( /dev/example_vg/mylv1 )

# Remove /dev/sdc1 to make my system the same as the Instructor
[root@desk ~]# gdisk /dev/sdc
    GPT fdisk (gdisk) version 1.0.7

    Partition table scan:
      MBR: protective
      BSD: not present
      APM: not present
      GPT: present

    Found valid GPT with protective MBR; using GPT.

    Command (? for help): d
        Using 1

    Command (? for help): w

        Final checks complete. About to write GPT data. THIS WILL OVERWRITE EXISTING
        PARTITIONS!!

        Do you want to proceed? (Y/N): y
        OK; writing new GUID partition table (GPT) to /dev/sdc.
        The operation has completed successfully.

# Let's create a GPT Partitions using gdisk 
[root@desk ~]# gdisk /dev/sdc
    GPT fdisk (gdisk) version 1.0.7

    Partition table scan:
      MBR: protective
      BSD: not present
      APM: not present
      GPT: present

    Found valid GPT with protective MBR; using GPT.

    Command (? for help): n
        Partition number (1-128, default 1): 1
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

[root@desk ~]# gdisk /dev/sdc
    GPT fdisk (gdisk) version 1.0.7

    Partition table scan:
    MBR: protective
    BSD: not present
    APM: not present
    GPT: present

    Found valid GPT with protective MBR; using GPT.

    Command (? for help): n
        Partition number (2-128, default 2):
        First sector (34-2097118, default = 206848) or {+-}size{KMGTP}:
        Last sector (206848-2097118, default = 2097118) or {+-}size{KMGTP}: +100M
        Current type is 8300 (Linux filesystem)
        Hex code or GUID (L to show codes, Enter = 8300):
        Changed type of partition to 'Linux filesystem'

    Command (? for help): w

        Final checks complete. About to write GPT data. THIS WILL OVERWRITE EXISTING
        PARTITIONS!!

        Do you want to proceed? (Y/N): y
        OK; writing new GUID partition table (GPT) to /dev/sdc.
        The operation has completed successfully.
[root@desk ~]# partprobe
# Even deleting sdc1 and sdc2, when I recreated the partion it pull the file format from
# previous lessons test that I used this partition
[root@desk ~]# lsblk -fi
    NAME        FSTYPE FSVER LABEL  UUID                                   FSAVAIL FSUSE% MOUNTPOINTS
    sda
    |-sda1      xfs                 c07b4e4a-9aa8-4f51-a653-d0fb026dd2fc    142.9M    67% /boot
    `-sda2      LVM2_m LVM2         01r8N3-pKgY-bHbi-xVRa-n838-Ktei-7mbyqj
      |-cs-root xfs                 7b2c3470-0adc-4323-86bf-24c20411df68      3.7G    57% /
      `-cs-swap swap   1            870fa721-5a7a-4289-9658-a03e88ae5a28                  [SWAP]
    sdb
    |-sdb1      xfs                 318c5565-1e4f-42d9-8535-8afbe0013644
    |-sdb2      LVM2_m LVM2         cd9iEW-DBZg-bneP-jKy6-AcKx-5ZU9-nNO1Mb
    | |-example_vg-mylv1
    | |         xfs                 d0b74b57-e85f-47c5-b998-1d360bc05677     88.7M     6% /examplesfs/xfs
    | `-example_vg-mylv2
    |           ext4   1.0          7f416bc5-2122-47a0-9804-109b9f82c724    167.9M     0% /examplesfs/ext4
    |-sdb4
    `-sdb5      LVM2_m LVM2         fyLCtR-dnrj-TsCB-31Tv-1jds-rIeG-q7gBE8
      `-example_vg-mylv2
                ext4   1.0          7f416bc5-2122-47a0-9804-109b9f82c724    167.9M     0% /examplesfs/ext4
      sdc
    |-sdc1      xfs          myxfs  d1d265db-fdb2-4441-ae01-a050c0adc359
    `-sdc2      ext4   1.0   myext4 395d4ed4-f776-4957-a9b0-a013029188a5
    sdd
    sr0
# As stated above, it still have a FS in /dev/sdc1 and /dev/sdc2 from previous tests
# I need to research more about it
# So -f will be required to force overwrite when formating them
[root@desk ~]# mkfs.xfs /dev/sdc1
    mkfs.xfs: /dev/sdc1 appears to contain an existing filesystem (xfs).
    mkfs.xfs: Use the -f option to force overwrite.

[root@desk ~]# mkfs.xfs -f /dev/sdc1
    # Filesystem should be larger than 300MB.
    # Log size should be at least 64MB.
    # Support for filesystems like this one is deprecated and they will not be supported in future releases.
    # meta-data=/dev/sdc1              isize=512    agcount=4, agsize=6400 blks
    #          =                       sectsz=512   attr=2, projid32bit=1
    #          =                       crc=1        finobt=1, sparse=1, rmapbt=0
    #          =                       reflink=1    bigtime=1 inobtcount=1 nrext64=0
    # data     =                       bsize=4096   blocks=25600, imaxpct=25
    #          =                       sunit=0      swidth=0 blks
    # naming   =version 2              bsize=4096   ascii-ci=0, ftype=1
    # log      =internal log           bsize=4096   blocks=1368, version=2
    #          =                       sectsz=512   sunit=0 blks, lazy-count=1
    # realtime =none                   extsz=4096   blocks=0, rtextents=0

[root@desk ~]# mkfs.ext4 /dev/sdc2
    mke2fs 1.46.5 (30-Dec-2021)
    /dev/sdc2 contains a ext4 file system labelled 'myext4'
            last mounted on Sat Mar  2 15:26:50 2024
    Proceed anyway? (y,N) y
    Creating filesystem with 102400 1k blocks and 25584 inodes
    Filesystem UUID: c9f54bae-9eb6-4301-9064-ae2388529ac1
    Superblock backups stored on blocks:
            8193, 24577, 40961, 57345, 73729

    Allocating group tables: done
    Writing inode tables: done
    Creating journal (4096 blocks): done
    Writing superblocks and filesystem accounting information: done
# 


# Add label to /dev/sdc1
[root@desk ~]# xfs_admin --help
    /usr/sbin/xfs_admin: illegal option -- -
    Usage: xfs_admin [-efjlpuV] [-c 0|1] [-L label] [-O v5_feature] [-r rtdev] [-U uuid] device [logdev]
[root@desk ~]# xfs_admin -L myxfs /dev/sdc1
    writing all SBs
    new label = "myxfs"
# Add label to /dev/sdc2
[root@desk ~]# tune2fs --help
    tune2fs 1.46.5 (30-Dec-2021)
    tune2fs: invalid option -- '-'
    Usage: tune2fs [-c max_mounts_count] [-e errors_behavior] [-f] [-g group]
            [-i interval[d|m|w]] [-j] [-J journal_options] [-l]
            [-m reserved_blocks_percent] [-o [^]mount_options[,...]]
            [-r reserved_blocks_count] [-u user] [-C mount_count]
            [-L volume_label] [-M last_mounted_dir]
            [-O [^]feature[,...]] [-Q quota_options]
            [-E extended-option[,...]] [-T last_check_time] [-U UUID]
            [-I new_inode_size] [-z undo_file] device
[root@desk ~]# tune2fs -L myext4 /dev/sdc2
    tune2fs 1.46.5 (30-Dec-2021)
[root@desk ~]# tune2fs -l /dev/sdc2 | grep name
    Filesystem volume name:   myext4
# Create Directories to mount /dev/sdc1 and /dev/sdc2
[root@desk ~]# mkdir -p /examplesfs/labels/xfs
[root@desk ~]# mkdir -p /examplesfs/labels/ext4
# /examplesfs/labels/ext4 and /examplesfs/labels/xfs are empty
[root@desk ~]# ls -R /examplesfs/
    /examplesfs/:
        ext4  labels  xfs

    /examplesfs/ext4:
        lost+found

    /examplesfs/ext4/lost+found:

    /examplesfs/labels:
        ext4  xfs

    /examplesfs/labels/ext4:

    /examplesfs/labels/xfs:

    /examplesfs/xfs:
        mytestfile

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
    /dev/example_vg/mylv1   /examplesfs/xfs xfs     defaults        0       0
    /dev/example_vg/mylv2   /examplesfs/ext4        ext4    defaults        0       0

# Add Partitions with the labels created previously
    # LABEL=myxfs     /examplesfs/labels/xfs  xfs     defaults        0       0
    # LABEL=myext4    /examplesfs/labels/ext4 ext4    defaults        0       0      
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
    /dev/example_vg/mylv1   /examplesfs/xfs xfs     defaults        0       0
    /dev/example_vg/mylv2   /examplesfs/ext4        ext4    defaults        0       0
    LABEL=myxfs     /examplesfs/labels/xfs  xfs     defaults        0       0
    LABEL=myext4    /examplesfs/labels/ext4 ext4    defaults        0       0     

[root@desk ~]# mount -a
    mount: (hint) your fstab has been modified, but systemd still uses
           the old version; use 'systemctl daemon-reload' to reload.
# Partitions 
    # /dev/sdc1 -> label myxfs   -> mounted on /examplesfs/labels/xfs
    # /dev/sdc2 -> label myext4  -> mounted on /examplesfs/labels/ext4 
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
    sr0
# 

# Review /etc/fstab to use the UUID of the Logical Volume /dev/example_vg/mylv1 instead of his name ( /dev/example_vg/mylv1 )
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
    /dev/example_vg/mylv1   /examplesfs/xfs xfs     defaults        0       0
    /dev/example_vg/mylv2   /examplesfs/ext4        ext4    defaults        0       0
    LABEL=myxfs     /examplesfs/labels/xfs  xfs     defaults        0       0
    LABEL=myext4    /examplesfs/labels/ext4 ext4    defaults        0       0

[root@desk ~]# blkid /dev/example_vg/mylv1
    /dev/example_vg/mylv1: UUID="d0b74b57-e85f-47c5-b998-1d360bc05677" TYPE="xfs"

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
[root@desk ~]# mount -a
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
    sr0

[root@desk ~]# reboot
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
    sr0
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
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 # Note: 
    # Primary Partition /dev/sdb2 type to Linux LVM - Created on Class 56 as MBR
    # Logical Partition /dev/sdb5 type to Linux LVM - Created on Class 58 as MBR
        # On top of /dev/sdb4 that is an Extended Partition
    



