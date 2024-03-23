##############################################################################################################
#### Discovery


[root@srv0 ~]# dnf install -y httpd
[root@srv0 ~]# systemctl enable httpd
    Created symlink /etc/systemd/system/multi-user.target.wants/httpd.service → /usr/lib/systemd/system/httpd.service.
[root@srv0 ~]# systemctl start httpd
[root@srv0 ~]# systemctl status httpd
    ● httpd.service - The Apache HTTP Server
         Loaded: loaded (/usr/lib/systemd/system/httpd.service; enabled; preset: disabled)
         Active: active (running) since Thu 2024-03-07 21:57:38 -03; 15s ago
           Docs: man:httpd.service(8)
       Main PID: 2590 (httpd)
         Status: "Total requests: 0; Idle/Busy workers 100/0;Requests/sec: 0; Bytes served/sec:   0 B/sec"
          Tasks: 177 (limit: 10812)
         Memory: 22.2M
            CPU: 79ms
         CGroup: /system.slice/httpd.service
                 ├─2590 /usr/sbin/httpd -DFOREGROUND
                 ├─2591 /usr/sbin/httpd -DFOREGROUND
                 ├─2592 /usr/sbin/httpd -DFOREGROUND
                 ├─2593 /usr/sbin/httpd -DFOREGROUND
                 └─2594 /usr/sbin/httpd -DFOREGROUND

    Mar 07 21:57:37 srv0.temweb.local systemd[1]: Starting The Apache HTTP Server...
    Mar 07 21:57:38 srv0.temweb.local systemd[1]: Started The Apache HTTP Server.
    Mar 07 21:57:38 srv0.temweb.local httpd[2590]: Server configured, listening on: port 80

# conf              Directory with the main configuration file
# conf.d            Direcotry where we can add configuration file
# conf.modules.d    Directory to add modules
# Other are links so Apache can run as chroot
# https://www.makeuseof.com/chroot-in-linux/
[root@srv0 ~]# cd /etc/httpd/
[root@srv0 httpd]# ls -l
    total 4
    drwxr-xr-x. 2 root root   37 Mar  7 21:56 conf
    drwxr-xr-x. 2 root root   82 Mar  7 21:56 conf.d
    drwxr-xr-x. 2 root root 4096 Mar  7 21:56 conf.modules.d
    lrwxrwxrwx. 1 root root   19 Feb 14 09:32 logs -> ../../var/log/httpd
    lrwxrwxrwx. 1 root root   29 Feb 14 09:32 modules -> ../../usr/lib64/httpd/modules
    lrwxrwxrwx. 1 root root   10 Feb 14 09:32 run -> /run/httpd
    lrwxrwxrwx. 1 root root   19 Feb 14 09:32 state -> ../../var/lib/httpd
[root@srv0 httpd]# cd conf
[root@srv0 conf]# ls -l
    total 28
    -rw-r--r--. 1 root root 12005 Feb 14 09:29 httpd.conf
    -rw-r--r--. 1 root root 13430 Feb 14 09:31 magic
[root@srv0 conf]# cp httpd.conf httpd.conf.back
[root@srv0 conf]# cat httpd.conf
        ##### Highlights of the file
        # In the following steps we will add config files to these diretories
        # LoadModule foo_module modules/mod_foo.so
        Include conf.modules.d/*.conf
        # Load config files in the "/etc/httpd/conf.d" directory, if any.
        IncludeOptional conf.d/*.conf

        # DocumentRoot: The directory out of which you will serve your website content. 
        DocumentRoot "/var/www/html"

[root@srv0 ~]# echo "Hello World" >> /var/www/html/index.html
[root@srv0 ~]# curl localhost
    Hello World
[root@srv0 ~]# firewall-cmd --list-services
    cockpit dhcpv6-client mountd nfs rpc-bind ssh 
[root@srv0 ~]# firewall-cmd --permanent --add-service=http
    success 
[root@srv0 ~]# firewall-cmd --reload
    success
[root@srv0 ~]# firewall-cmd --list-services
    cockpit dhcpv6-client http mountd nfs rpc-bind ssh

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
