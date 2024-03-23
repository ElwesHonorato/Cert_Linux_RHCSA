
[elwes@desk ~]$ cd meuarquivo/
[elwes@desk meuarquivo]$ ls -l
total 0
-rw-r--r--. 1 elwes elwes 0 Feb 25 15:38 file1
-rw-r--r--. 1 elwes elwes 0 Feb 25 15:38 file2
-rw-r--r--. 1 elwes elwes 0 Feb 25 15:38 file3
[elwes@desk meuarquivo]$ scp file1 root@192.168.0.100:/root
The authenticity of host '192.168.0.100 (192.168.0.100)' can't be established.
ED25519 key fingerprint is SHA256:SvPXbo8uTv5mfYM3ObiPv8NEC3syVwUolJTcv96i+jk.
This key is not known by any other names
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '192.168.0.100' (ED25519) to the list of known hosts.
root@192.168.0.100's password:
file1                                                               100%    0     0.0KB/s   00:00

/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-//-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/

[root@dev1 /]# cd root/
[root@dev1 ~]# ls
anaconda-ks.cfg  file1

##################################################################################################################################
##################################################################################################################################
##################################################################################################################################
[elwes@desk meuarquivo]$ ls
file1  file2  file3

[elwes@desk meuarquivo]$ scp root@192.168.0.100:/root/anaconda-ks.cfg .                                                                             '
root@192.168.0.100's password:
anaconda-ks.cfg                                                     100% 1503   246.8KB/s   00:00

[elwes@desk meuarquivo]$ ls
anaconda-ks.cfg  file1  file2  file3


##################################################################################################################################
##################################################################################################################################
##################################################################################################################################

[elwes@desk ~]$ ls -d /etc
/etc
[elwes@desk ~]$ scp -r /etc/ root@192.168.0.100:/tmp
root@192.168.0.100's password:
mtab                                                                100%    0     0.0KB/s   00:00
fstab                                                               100%  579   327.4KB/s   00:00
Couldn't open local file "/etc/crypttab" for reading: Permission denied
Uploading of file /etc/crypttab to /tmp/etc/crypttab failed!
Failed to open dir "/etc/lvm/devices": Permission denied
Failed to open dir "/etc/lvm/archive": Permission denied
Failed to open dir "/etc/lvm/backup": Permission denied
Failed to open dir "/etc/lvm/cache": Permission denied
cache-mq.profile                                                    100%  531   192.4KB/s   00:00
cache-smq.profile                                                   100%  339   123.7KB/s   00:00
command_profile_template.profile                                    100% 3020     1.1MB/s   00:00
lvmdbusd.profile                                                    100% 2309   585.7KB/s   00:00
metadata_profile_template.profile                                   100%  828   324.4KB/s   00:00
thin-generic.profile                                                100%   76    19.8KB/s   00:00
thin-performance.profile                                            100%   80    28.7KB/s   00:00

/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-//-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/

[root@dev1 /]# cd /tmp/

[root@dev1 tmp]# ls
etc
systemd-private-c824f0b9db16484fabea59b2c376c23d-chronyd.service-Xry6G3
systemd-private-c824f0b9db16484fabea59b2c376c23d-dbus-broker.service-huMIsZ
systemd-private-c824f0b9db16484fabea59b2c376c23d-kdump.service-hLPd85
systemd-private-c824f0b9db16484fabea59b2c376c23d-ModemManager.service-i1IoMO
systemd-private-c824f0b9db16484fabea59b2c376c23d-systemd-logind.service-3br7Zm
tmpaddon

[root@dev1 tmp]# ls etc/
accountsservice          firewalld       mailcap                   rwtab.d
adjtime                  flatpak         makedumpfile.conf.sample  samba
aliases                  fonts           man_db.conf               sane.d
alsa                     foomatic        mcelog                    sasl2
alternatives             fprintd.conf    microcode_ctl             security
anacrontab               fstab           mime.types                selinux
anthy-unicode.conf       fuse.conf       mke2fs.conf               services
appstream.conf           fwupd           modprobe.d                sestatus.conf
asound.conf              gcrypt          modules-load.d            setroubleshoot
at.deny                  gdm             motd                      sgml
audit                    geoclue         motd.d                    shells

##################################################################################################################################
##################################################################################################################################
##################################################################################################################################



##################################################################################################################################
##################################################################################################################################
##################################################################################################################################
