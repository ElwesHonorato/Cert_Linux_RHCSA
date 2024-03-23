##############################################################################################################
#### Discovery

# /-/-/-/-/-/-/-/-/-/-/-/ ------------- srv0 ------------- /-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/
[root@srv0 ~]# hostname
    srv0.temweb.local
[root@srv0 ~]# cd /etc/httpd/conf.d
[root@srv0 conf.d]# ls
    autoindex.conf  README  rhel.conf  userdir.conf  welcome.old
[root@srv0 conf.d]# cp rhel.conf mysite.conf
[root@srv0 conf.d]# vi mysite.conf
    <VirtualHost *:80>
            ServerAdmin meuemail@exemplo.com
            DocumentRoot /web/mysite
            ServerName mysite.temweb.local
            ErrorLog logs/mysite.temweb.local-error-log
            CustomLog logs/mysite.temweb.local-custom-error-log common
    </VirtualHost>  


    <Directory /web>
    Require all granted
    AllowOverride None
    </Directory>

[root@srv0 conf.d]# mkdir -p /web/mysite
[root@srv0 conf.d]# systemctl restart httpd
[root@srv0 ~]# systemctl restart httpd
[root@srv0 ~]# firewall-cmd --list-all
    dmz (active)
        target: default
        icmp-block-inversion: no
        interfaces: enp0s3
        sources:
        services: proxy_reversa ssh
        ports:
        protocols:
        forward: yes
        masquerade: no
        forward-ports:
        source-ports:
        icmp-blocks:
        rich rules:
[root@srv0 ~]# firewall-cmd --list-services
    proxy_reversa ssh
[root@srv0 ~]# firewall-cmd --add-service=http
    success
[root@srv0 ~]# firewall-cmd --list-services
    http proxy_reversa ssh
# /-/-/-/-/-/-/-/-/-/-/-/ ------------- dev1 ------------- /-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/
[root@dev1 ~]# cat /etc/hosts
    127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
    ::1         localhost localhost.localdomain localhost6 localhost6.localdomain6
    192.168.0.10    rhel.temweb.local       rhel
[root@dev1 ~]# vi /etc/hosts
    127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
    ::1         localhost localhost.localdomain localhost6 localhost6.localdomain6
    192.168.0.10    rhel.temweb.local       rhel
    192.168.0.10    mysite.temweb.local mysite
[root@dev1 ~]# curl mysite
    <!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML 2.0//EN">
    <html><head>
    <title>403 Forbidden</title>
    </head><body>
    <h1>Forbidden</h1>
    <p>You don''t have permission to access this resource.</p>
    </body></html>

# /-/-/-/-/-/-/-/-/-/-/-/ ------------- srv0 ------------- /-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/
[root@srv0 ~]# setenforce 0
[root@srv0 ~]# getenforce
    Permissive
# /-/-/-/-/-/-/-/-/-/-/-/ ------------- dev1 ------------- /-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/
[root@dev1 ~]# curl mysite
    <!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML 2.0//EN">
    <html><head>
    <title>403 Forbidden</title>
    </head><body>
    <h1>Forbidden</h1>
    <p>You don''t have permission to access this resource.</p>
    </body></html>
# /-/-/-/-/-/-/-/-/-/-/-/ ------------- srv0 ------------- /-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/
[root@srv0 ~]# echo "MySite SE LINUX" > /web/mysite/index.html
# /-/-/-/-/-/-/-/-/-/-/-/ ------------- dev1 ------------- /-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/
[root@dev1 ~]# curl mysite
    MySite SE LINUX
# /-/-/-/-/-/-/-/-/-/-/-/ ------------- srv0 ------------- /-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/
[root@srv0 ~]# setenforce 1
[root@srv0 ~]# getenforce
    Enforcing
# /-/-/-/-/-/-/-/-/-/-/-/ ------------- dev1 ------------- /-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/
[root@dev1 ~]# curl mysite
    <!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML 2.0//EN">
    <html><head>
    <title>403 Forbidden</title>
    </head><body>
    <h1>Forbidden</h1>
    <p>You don''t have permission to access this resource.</p>
    </body></html>
# /-/-/-/-/-/-/-/-/-/-/-/ ------------- srv0 ------------- /-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/
[root@srv0 ~]# ls -Z /web
    unconfined_u:object_r:default_t:s0 mysite
[root@srv0 ~]# ls -Z /var/www
    system_u:object_r:httpd_sys_script_exec_t:s0 cgi-bin
        system_u:object_r:httpd_sys_content_t:s0 html
[root@srv0 ~]# dnf search trouble
    Updating Subscription Management repositories.
    Unable to read consumer identity

    This system is not registered with an entitlement server. You can use subscription-manager to register.

    Last metadata expiration check: 6:14:19 ago on Wed 20 Mar 2024 02:10:55 PM -03.
    ================================== Name & Summary Matched: trouble ===================================
    setroubleshoot.x86_64 : Helps troubleshoot SELinux problems
    setroubleshoot-plugins.noarch : Analysis plugins for use with setroubleshoot
    setroubleshoot-server.x86_64 : SELinux troubleshoot server
    ====================================== Summary Matched: trouble ======================================
    cockpit-system.noarch : Cockpit admin interface package for configuring and troubleshooting a system
    sos.noarch : A set of tools to gather troubleshooting information from a system
    texlive-notoccite.noarch : Prevent trouble from citations in table of contents, etc
[root@srv0 ~]# dnf install setroubleshoot-server
    Updating Subscription Management repositories.
    Unable to read consumer identity

    This system is not registered with an entitlement server. You can use subscription-manager to register.

    CentOS Stream 9 - BaseOS                                               14 kB/s |  20 kB     00:01
    CentOS Stream 9 - AppStream                                            21 kB/s |  21 kB     00:00
    CentOS Stream 9 - Extras packages                                      21 kB/s |  22 kB     00:01
    Package setroubleshoot-server-3.3.32-1.el9.x86_64 is already installed.
    Dependencies resolved.
    Nothing to do.
    Complete!
[root@srv0 ~]# man semanage
[root@srv0 ~]# man semanage-fcontext
[root@srv0 ~]# semanage fcontext -a -t httpd_sys_content_t "/web(/.*)?"
[root@srv0 ~]# ls -Z /web/
    unconfined_u:object_r:default_t:s0 mysite
[root@srv0 ~]# restorecon -Rv /web/
    Relabeled /web from unconfined_u:object_r:default_t:s0 to unconfined_u:object_r:httpd_sys_content_t:s0
    Relabeled /web/mysite from unconfined_u:object_r:default_t:s0 to unconfined_u:object_r:httpd_sys_content_t:s0
    Relabeled /web/mysite/index.html from unconfined_u:object_r:default_t:s0 to unconfined_u:object_r:httpd_sys_content_t:s0
[root@srv0 ~]# ls -Z /web/
    unconfined_u:object_r:httpd_sys_content_t:s0 mysite
[root@srv0 ~]# ls -Z /web/mysite/
    unconfined_u:object_r:httpd_sys_content_t:s0 index.html
# /-/-/-/-/-/-/-/-/-/-/-/ ------------- srv0 ------------- /-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/
[root@dev1 ~]# curl mysite
    MySite SE LINUX
# /-/-/-/-/-/-/-/-/-/-/-/ ------------- srv0 ------------- /-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/
# /-/-/-/-/-/-/-/-/-/-/-/ ------------- srv0 ------------- /-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/
# /-/-/-/-/-/-/-/-/-/-/-/ ------------- srv0 ------------- /-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/
# /-/-/-/-/-/-/-/-/-/-/-/ ------------- srv0 ------------- /-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/
# /-/-/-/-/-/-/-/-/-/-/-/ ------------- srv0 ------------- /-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/
# /-/-/-/-/-/-/-/-/-/-/-/ ------------- srv0 ------------- /-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/



# /-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-
# /-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-






































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
