##############################################################################################################
#### Discovery

[root@srv0 ~]# systemctl status httpd
  ● httpd.service - The Apache HTTP Server
       Loaded: loaded (/usr/lib/systemd/system/httpd.service; enabled; preset: disabled)
       Active: active (running) since Thu 2024-03-07 21:57:38 -03; 2h 13min ago
         Docs: man:httpd.service(8)
     Main PID: 2590 (httpd)
       Status: "Total requests: 3" ; Idle/Busy workers 100/0;Requests/sec: 0.000376; Bytes served/sec:   >
        Tasks: 230 (limit: 10812)
       Memory: 27.4M
          CPU: 4.489s
       CGroup: /system.slice/httpd.service
               ├─2590 /usr/sbin/httpd -DFOREGROUND
               ├─2591 /usr/sbin/httpd -DFOREGROUND
               ├─2592 /usr/sbin/httpd -DFOREGROUND
               ├─2593 /usr/sbin/httpd -DFOREGROUND
               ├─2594 /usr/sbin/httpd -DFOREGROUND
               └─2864 /usr/sbin/httpd -DFOREGROUND

  Mar 07 21:57:37 srv0.temweb.local systemd[1]: Starting The Apache HTTP Server...
  Mar 07 21:57:38 srv0.temweb.local systemd[1]: Started The Apache HTTP Server.
  Mar 07 21:57:38 srv0.temweb.local httpd[2590]: Server configured, listening on: port 80

[root@srv0 ~]# cat /etc/hosts
  127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
  ::1         localhost localhost.localdomain localhost6 localhost6.localdomain6

[root@srv0 ~]# vi /etc/hosts
  127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
  ::1         localhost localhost.localdomain localhost6 localhost6.localdomain6
  192.168.0.10    rhel.temweb.local

[root@srv0 ~]# mkdir /var/www/html/rhel
[root@srv0 ~]# vi /etc/httpd/conf.d/rhel.conf
<VirtualHost *:80>
        ServerAdmin meuemail@exemplo.com
        DocumentRoot /var/www/html/rhel
        ServerName rhel.temweb.local
        ErrorLog logs/rhel.temweb.local-error-log
        CustomLog logs/rhel.temweb.local-custom-error-log common
</VirtualHost>
[root@srv0 ~]# echo "My website RHEL" >> /var/www/html/rhel/index.html
[root@srv0 ~]# systemctl restart httpd



[root@srv0 isos]# ls
CentOS-Stream-9-latest-x86_64-dvd1.iso
[root@srv0 isos]# mount -o loop CentOS-Stream-9-latest-x86_64-dvd1.iso /mnt
mount: /mnt: WARNING: source write-protected, mounted read-only.
[root@srv0 isos]# ls /mnt
AppStream  BaseOS  EFI  EULA  extra_files.json  images  isolinux  LICENSE  media.repo
[root@srv0 isos]# cp -r /mnt/* /var/www/html/rhel/
cp: cannot create directory '/var/www/html/rhel/AppStream': No space left on device
cp: cannot create directory '/var/www/html/rhel/BaseOS': No space left on device
cp: cannot create directory '/var/www/html/rhel/EFI': No space left on device
cp: cannot create regular file '/var/www/html/rhel/EULA': No space left on device
cp: cannot create regular file '/var/www/html/rhel/extra_files.json': No space left on device
cp: cannot create directory '/var/www/html/rhel/images': No space left on device
cp: cannot create directory '/var/www/html/rhel/isolinux': No space left on device
cp: cannot create regular file '/var/www/html/rhel/LICENSE': No space left on device
cp: cannot create regular file '/var/www/html/rhel/media.repo': No space left on device

!!!! COOL STUFF !!!
I had to extend  the Logical Volume cs-root


##################################################################################################################################
##################################################################################################################################
##################################################################################################################################

[root@dev1 yum.repos.d]# dnf repoinfo
Last metadata expiration check: 0:01:43 ago on Mon 11 Mar 2024 01:43:34 AM -03.
Repo-id            : appstream
Repo-name          : CentOS Stream 9 - AppStream
Repo-revision      : 9-stream
Repo-distro-tags      : [cpe:/o:centos-stream:centos-stream:9]:  ,  , 9, C, O, S, S, a, e, e, m, n, r,
                      : t, t
Repo-updated       : Fri 08 Mar 2024 05:33:39 AM -03
Repo-pkgs          : 16,233
Repo-available-pkgs: 15,952
Repo-size          : 30 G
Repo-metalink      : https://mirrors.centos.org/metalink?repo=centos-appstream-9-stream&arch=x86_64&protocol=https,http
  Updated          : Sun 10 Mar 2024 11:33:55 PM -03
Repo-baseurl       : http://ftp.udx.icscoe.jp/Linux/CentOS-stream/9-stream/AppStream/x86_64/os/ (125
                   : more)
Repo-expire        : 21,600 second(s) (last: Sun 10 Mar 2024 11:33:55 PM -03)
Repo-filename      : /etc/yum.repos.d/centos.repo

Repo-id            : baseos
Repo-name          : CentOS Stream 9 - BaseOS
Repo-revision      : 9-stream
Repo-distro-tags      : [cpe:/o:centos-stream:centos-stream:9]:  ,  , 9, C, O, S, S, a, e, e, m, n, r,
                      : t, t
Repo-updated       : Fri 08 Mar 2024 05:31:38 AM -03
Repo-pkgs          : 4,371
Repo-available-pkgs: 4,371
Repo-size          : 6.0 G
Repo-metalink      : https://mirrors.centos.org/metalink?repo=centos-baseos-9-stream&arch=x86_64&protocol=https,http
  Updated          : Sun 10 Mar 2024 11:33:54 PM -03
Repo-baseurl       : http://mirror.nyist.edu.cn/centos-stream/9-stream/BaseOS/x86_64/os/ (125 more)
Repo-expire        : 21,600 second(s) (last: Sun 10 Mar 2024 11:33:54 PM -03)
Repo-filename      : /etc/yum.repos.d/centos.repo

Repo-id            : extras-common
Repo-name          : CentOS Stream 9 - Extras packages
Repo-revision      : 1709760575
Repo-updated       : Wed 06 Mar 2024 06:29:35 PM -03
Repo-pkgs          : 74
Repo-available-pkgs: 74
Repo-size          : 742 k
Repo-metalink      : https://mirrors.centos.org/metalink?repo=centos-extras-sig-extras-common-9-stream&arch=x86_64&protocol=https,http
  Updated          : Sun 10 Mar 2024 11:33:57 PM -03
Repo-baseurl       : http://ftp.yz.yamagata-u.ac.jp/pub/linux/centos-stream/SIGs/9-stream/extras/x86_64/extras-common/
                   : (125 more)
Repo-expire        : 21,600 second(s) (last: Sun 10 Mar 2024 11:33:57 PM -03)
Repo-filename      : /etc/yum.repos.d/centos-addons.repo

Repo-id            : my_AppStream
Repo-name          : my_appstream
Repo-revision      : 1707748854
Repo-updated       : Mon 12 Feb 2024 11:40:54 AM -03
Repo-pkgs          : 5,785
Repo-available-pkgs: 5,583
Repo-size          : 7.3 G
Repo-baseurl       : http://rhel.temweb.local/AppStream
Repo-expire        : 172,800 second(s) (last: Mon 11 Mar 2024 01:43:34 AM -03)
Repo-filename      : /etc/yum.repos.d/myrepo.repo

Repo-id            : my_BaseOS
Repo-name          : my_baseos
Repo-revision      : 1707748878
Repo-updated       : Mon 12 Feb 2024 11:41:18 AM -03
Repo-pkgs          : 1,164
Repo-available-pkgs: 1,164
Repo-size          : 1.3 G
Repo-baseurl       : http://rhel.temweb.local/BaseOS
Repo-expire        : 172,800 second(s) (last: Mon 11 Mar 2024 01:43:32 AM -03)
Repo-filename      : /etc/yum.repos.d/myrepo.repo
Total packages: 27,627

##################################################################################################################################
##################################################################################################################################
##################################################################################################################################



##################################################################################################################################
##################################################################################################################################
##################################################################################################################################



##################################################################################################################################
##################################################################################################################################
##################################################################################################################################
