# Acrescente as 2 partições para o seu SWAP
[root@dev1 ~]# lsblk -fi
    NAME      FSTYPE      FSVER    LABEL UUID                                   FSAVAIL FSUSE% MOUNTPOINTS
    sda
    |-sda1    xfs                        c07b4e4a-9aa8-4f51-a653-d0fb026dd2fc    142.9M    67% /boot
    ``-sda2    LVM2_member LVM2 001       01r8N3-pKgY-bHbi-xVRa-n838-Ktei-7mbyqj
      |-cs-root
      |       xfs                        7b2c3470-0adc-4323-86bf-24c20411df68      3.9G    54% /
      ``-cs-swap
              swap        1              870fa721-5a7a-4289-9658-a03e88ae5a28                  [SWAP]
    sdb
    |-sdb1
    |-sdb2
    |-sdb3
    |-sdb4
    ``-sdb5
    sdc
    sdd
    sr0

[root@dev1 ~]# free -m
                   total        used        free      shared  buff/cache   available
    Mem:            1751         340        1092           5         469        1411
    Swap:            955           0         955

[root@dev1 ~]# vgs
  VG #PV #LV #SN Attr   VSize  VFree
  cs   1   2   0 wz--n- <9.51g    0
[root@dev1 ~]# pvs
  PV         VG     Fmt  Attr PSize   PFree
  /dev/sda2  cs     lvm2 a--   <9.51g      0
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

[root@dev1 ~]# pvcreate /dev/sdb4 /dev/sdb5
  Physical volume "/dev/sdb4" successfully created.
  Physical volume "/dev/sdb5" successfully created.
[root@dev1 ~]# vgcreate myswap /dev/sdb4
  Volume group "myswap" successfully created
[root@dev1 ~]# vgextend myswap /dev/sdb5
  Volume group "myswap" successfully extended
[root@dev1 ~]# vgs
  VG     #PV #LV #SN Attr   VSize   VFree
  cs       1   2   0 wz--n-  <9.51g      0
  myswap   2   0   0 wz--n- 392.00m 392.00m
[root@dev1 ~]# pvs
  PV         VG     Fmt  Attr PSize   PFree
  /dev/sda2  cs     lvm2 a--   <9.51g      0
  /dev/sdb4  myswap lvm2 a--  196.00m 196.00m
  /dev/sdb5  myswap lvm2 a--  196.00m 196.00m
[root@dev1 ~]# lvs
  LV   VG Attr       LSize   Pool Origin Data%  Meta%  Move Log Cpy%Sync Convert
  root cs -wi-ao----   8.57g
  swap cs -wi-ao---- 956.00m
[root@dev1 ~]# vgdisplay myswap
  --- Volume group ---
  VG Name               myswap
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
  VG UUID               TjCZYI-Dw13-iuGx-hcpn-a6GK-JL3u-71dBsk
[root@dev1 ~]# lvcreate -l 98 -n lv_swap_1 myswap
  Logical volume "lv_swap_1" created.
[root@dev1 ~]# lvs
  LV        VG     Attr       LSize   Pool Origin Data%  Meta%  Move Log Cpy%Sync Convert
  root      cs     -wi-ao----   8.57g
  swap      cs     -wi-ao---- 956.00m
  lv_swap_1 myswap -wi-a----- 392.00m
[root@dev1 ~]# vgdisplay myswap
  --- Volume group ---
  VG Name               myswap
  System ID
  Format                lvm2
  Metadata Areas        2
  Metadata Sequence No  3
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
  Alloc PE / Size       98 / 392.00 MiB
  Free  PE / Size       0 / 0
  VG UUID               TjCZYI-Dw13-iuGx-hcpn-a6GK-JL3u-71dBsk
[root@dev1 ~]# mkswap /dev/myswap/lv_swap_1
    Setting up swapspace version 1, size = 392 MiB (411037696 bytes)
    no label, UUID=66afef66-f78f-48a8-a344-6da311543139
[root@dev1 ~]# swapon /dev/myswap/lv_swap_1
[root@dev1 ~]# free -m
                   total        used        free      shared  buff/cache   available
    Mem:            1751         355        1077           5         469        1396
    Swap:           1347           0        1347


