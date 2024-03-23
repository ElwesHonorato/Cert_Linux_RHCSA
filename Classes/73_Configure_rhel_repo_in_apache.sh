##############################################################################################################
#### Discovery

[root@srv0 isos]# ls
  CentOS-Stream-9-latest-x86_64-dvd1.iso

[root@srv0 rhel]# mount -o loop /isos/CentOS-Stream-9-latest-x86_64-dvd1.iso /mnt
  mount: /mnt: WARNING: source write-protected, mounted read-only.

[root@srv0 rhel]# ls /mnt
  AppStream  BaseOS  EFI  EULA  extra_files.json  images  isolinux  LICENSE  media.repo

[root@srv0 isos]# cp -r /mnt/* /var/www/html/rhel

[root@srv0 rhel]# ls -Z /var/www/html/rhel/
  unconfined_u:object_r:httpd_sys_content_t:s0 AppStream
  unconfined_u:object_r:httpd_sys_content_t:s0 BaseOS
  unconfined_u:object_r:httpd_sys_content_t:s0 EFI
  unconfined_u:object_r:httpd_sys_content_t:s0 EULA
  unconfined_u:object_r:httpd_sys_content_t:s0 extra_files.json
  unconfined_u:object_r:httpd_sys_content_t:s0 images
  unconfined_u:object_r:httpd_sys_content_t:s0 index.html
  unconfined_u:object_r:httpd_sys_content_t:s0 isolinux
  unconfined_u:object_r:httpd_sys_content_t:s0 LICENSE
  unconfined_u:object_r:httpd_sys_content_t:s0 media.repo

# Remove previouly added index.html
[root@srv0 rhel]# rm -f /var/www/html/rhel/index.html

# Access rhel.temweb.local and now  you should be redirected to "HTTP SERVER TEST PAGE"
  # you can only access by the name in Machines where you saved the server name to an ip in /etc/hosts

[root@srv0 rhel]# cd /etc/httpd/conf.d
[root@srv0 conf.d]# ls -l
  total 20
  -rw-r--r--. 1 root root 2916 Feb 14 09:32 autoindex.conf
  -rw-r--r--. 1 root root  400 Feb 14 09:32 README
  -rw-r--r--. 1 root root  267 Mar 10 13:41 rhel.conf
  -rw-r--r--. 1 root root 1252 Feb 14 09:29 userdir.conf
  -rw-r--r--. 1 root root  653 Feb 14 09:29 welcome.conf
# Rename welcome.conf so the file won't be read and instead of showing "HTTP SERVER TEST PAGE" the root directory with the folders
# will be shown
[root@srv0 conf.d]# mv welcome.conf welcome.old
[root@srv0 conf.d]# systemctl restart httpd

# !!!! ORDER TO START THE FIRST PAGE
# 1 - Reads index.html file
# 2 - Reads /etc/httpd/conf.d/welcome.conf
# 3 - Presents the Apache server root directory





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
