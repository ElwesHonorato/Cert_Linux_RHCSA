# Configure um repositório de instalação local usando o repositório da máquina srv0
[root@dev1 yum.repos.d]# dnf module list nginx
    Last metadata expiration check: 0:00:21 ago on Tue 12 Mar 2024 12:42:53 AM -03.
    Lab 8 - Local Repo - Appstream
    Name                  Stream                 Profiles                   Summary
    nginx                 1.22                   common [d]                 nginx webserver
    nginx                 1.24                   common [d]                 nginx webserver

    CentOS Stream 9 - AppStream
    Name                  Stream                 Profiles                   Summary
    nginx                 1.22                   common [d]                 nginx webserver
    nginx                 1.24                   common [d]                 nginx webserver

    my_appstream
    Name                  Stream                 Profiles                   Summary
    nginx                 1.22                   common [d]                 nginx webserver
    nginx                 1.24                   common [d]                 nginx webserver

    Hint: [d]efault, [e]nabled, [x]disabled, [i]nstalled

[root@dev1 yum.repos.d]# dnf module enable nginx:1.22
    Last metadata expiration check: 0:01:41 ago on Tue 12 Mar 2024 12:42:53 AM -03.
    Dependencies resolved.
    ======================================================================================================
     Package                 Architecture           Version                 Repository               Size
    ======================================================================================================
    Enabling module streams:
     nginx                                          1.22

    Transaction Summary
    ======================================================================================================
    Is this ok [y/N]: y
    Complete!

[root@dev1 yum.repos.d]# dnf module list nginx
    Last metadata expiration check: 0:01:50 ago on Tue 12 Mar 2024 12:42:53 AM -03.
    Lab 8 - Local Repo - Appstream
    Name                  Stream                  Profiles                  Summary
    nginx                 1.22 [e]                common [d]                nginx webserver
    nginx                 1.24                    common [d]                nginx webserver

    CentOS Stream 9 - AppStream
    Name                  Stream                  Profiles                  Summary
    nginx                 1.22 [e]                common [d]                nginx webserver
    nginx                 1.24                    common [d]                nginx webserver

    my_appstream
    Name                  Stream                  Profiles                  Summary
    nginx                 1.22 [e]                common [d]                nginx webserver
    nginx                 1.24                    common [d]                nginx webserver

    Hint: [d]efault, [e]nabled, [x]disabled, [i]nstalled

[root@dev1 yum.repos.d]# dnf module install nginx
    Last metadata expiration check: 0:02:11 ago on Tue 12 Mar 2024 12:42:53 AM -03.
    Dependencies resolved.
    ======================================================================================================
     Package                        Arch      Version                                  Repository    Size
    ======================================================================================================
    Installing group/module packages:
     nginx                          x86_64    1:1.22.1-4.module_el9+666+132dc76f       appstream     38 k
     nginx-all-modules              noarch    1:1.22.1-4.module_el9+666+132dc76f       appstream    9.6 k
     nginx-filesystem               noarch    1:1.22.1-4.module_el9+666+132dc76f       appstream     11 k
     nginx-mod-http-image-filter    x86_64    1:1.22.1-4.module_el9+666+132dc76f       appstream     21 k
     nginx-mod-http-perl            x86_64    1:1.22.1-4.module_el9+666+132dc76f       appstream     33 k
     nginx-mod-http-xslt-filter     x86_64    1:1.22.1-4.module_el9+666+132dc76f       appstream     20 k
     nginx-mod-mail                 x86_64    1:1.22.1-4.module_el9+666+132dc76f       appstream     55 k
     nginx-mod-stream               x86_64    1:1.22.1-4.module_el9+666+132dc76f       appstream     81 k
    Installing dependencies:
     centos-logos-httpd             noarch    90.4-1.el9                               appstream    252 k
     nginx-core                     x86_64    1:1.22.1-4.module_el9+666+132dc76f       appstream    573 k
    Installing module profiles:
     nginx/common

    Transaction Summary
    ======================================================================================================
    Install  10 Packages

    Total download size: 1.1 M
    Installed size: 2.6 M
    Is this ok [y/N]: y
    Downloading Packages:
    (1/10): nginx-all-modules-1.22.1-4.module_el9+666+132dc76f.noarch.rpm 4.0 kB/s | 9.6 kB     00:02
    (2/10): nginx-1.22.1-4.module_el9+666+132dc76f.x86_64.rpm              14 kB/s |  38 kB     00:02
    (3/10): centos-logos-httpd-90.4-1.el9.noarch.rpm                       76 kB/s | 252 kB     00:03
    (4/10): nginx-filesystem-1.22.1-4.module_el9+666+132dc76f.noarch.rpm  6.9 kB/s |  11 kB     00:01
    (5/10): nginx-mod-http-image-filter-1.22.1-4.module_el9+666+132dc76f.  12 kB/s |  21 kB     00:01
    (6/10): nginx-core-1.22.1-4.module_el9+666+132dc76f.x86_64.rpm        170 kB/s | 573 kB     00:03
    (7/10): nginx-mod-http-perl-1.22.1-4.module_el9+666+132dc76f.x86_64.r  18 kB/s |  33 kB     00:01
    (8/10): nginx-mod-http-xslt-filter-1.22.1-4.module_el9+666+132dc76f.x  12 kB/s |  20 kB     00:01
    (9/10): nginx-mod-mail-1.22.1-4.module_el9+666+132dc76f.x86_64.rpm     27 kB/s |  55 kB     00:02
    (10/10): nginx-mod-stream-1.22.1-4.module_el9+666+132dc76f.x86_64.rpm  39 kB/s |  81 kB     00:02
    ------------------------------------------------------------------------------------------------------
    Total                                                                 114 kB/s | 1.1 MB     00:09
    Running transaction check
    Transaction check succeeded.
    Running transaction test
    Transaction test succeeded.
    Running transaction
      Preparing        :                                                                              1/1
      Running scriptlet: nginx-filesystem-1:1.22.1-4.module_el9+666+132dc76f.noarch                  1/10
      Installing       : nginx-filesystem-1:1.22.1-4.module_el9+666+132dc76f.noarch                  1/10
      Installing       : nginx-core-1:1.22.1-4.module_el9+666+132dc76f.x86_64                        2/10
      Installing       : centos-logos-httpd-90.4-1.el9.noarch                                        3/10
      Installing       : nginx-1:1.22.1-4.module_el9+666+132dc76f.x86_64                             4/10
      Running scriptlet: nginx-1:1.22.1-4.module_el9+666+132dc76f.x86_64                             4/10
      Installing       : nginx-mod-http-image-filter-1:1.22.1-4.module_el9+666+132dc76f.x86_64       5/10
      Running scriptlet: nginx-mod-http-image-filter-1:1.22.1-4.module_el9+666+132dc76f.x86_64       5/10
      Installing       : nginx-mod-http-perl-1:1.22.1-4.module_el9+666+132dc76f.x86_64               6/10
      Running scriptlet: nginx-mod-http-perl-1:1.22.1-4.module_el9+666+132dc76f.x86_64               6/10
      Installing       : nginx-mod-http-xslt-filter-1:1.22.1-4.module_el9+666+132dc76f.x86_64        7/10
      Running scriptlet: nginx-mod-http-xslt-filter-1:1.22.1-4.module_el9+666+132dc76f.x86_64        7/10
      Installing       : nginx-mod-mail-1:1.22.1-4.module_el9+666+132dc76f.x86_64                    8/10
      Running scriptlet: nginx-mod-mail-1:1.22.1-4.module_el9+666+132dc76f.x86_64                    8/10
      Installing       : nginx-mod-stream-1:1.22.1-4.module_el9+666+132dc76f.x86_64                  9/10
      Running scriptlet: nginx-mod-stream-1:1.22.1-4.module_el9+666+132dc76f.x86_64                  9/10
      Installing       : nginx-all-modules-1:1.22.1-4.module_el9+666+132dc76f.noarch                10/10
      Running scriptlet: nginx-all-modules-1:1.22.1-4.module_el9+666+132dc76f.noarch                10/10
      Verifying        : centos-logos-httpd-90.4-1.el9.noarch                                        1/10
      Verifying        : nginx-1:1.22.1-4.module_el9+666+132dc76f.x86_64                             2/10
      Verifying        : nginx-all-modules-1:1.22.1-4.module_el9+666+132dc76f.noarch                 3/10
      Verifying        : nginx-core-1:1.22.1-4.module_el9+666+132dc76f.x86_64                        4/10
      Verifying        : nginx-filesystem-1:1.22.1-4.module_el9+666+132dc76f.noarch                  5/10
      Verifying        : nginx-mod-http-image-filter-1:1.22.1-4.module_el9+666+132dc76f.x86_64       6/10
      Verifying        : nginx-mod-http-perl-1:1.22.1-4.module_el9+666+132dc76f.x86_64               7/10
      Verifying        : nginx-mod-http-xslt-filter-1:1.22.1-4.module_el9+666+132dc76f.x86_64        8/10
      Verifying        : nginx-mod-mail-1:1.22.1-4.module_el9+666+132dc76f.x86_64                    9/10
      Verifying        : nginx-mod-stream-1:1.22.1-4.module_el9+666+132dc76f.x86_64                 10/10

    Installed:
      centos-logos-httpd-90.4-1.el9.noarch
      nginx-1:1.22.1-4.module_el9+666+132dc76f.x86_64
      nginx-all-modules-1:1.22.1-4.module_el9+666+132dc76f.noarch
      nginx-core-1:1.22.1-4.module_el9+666+132dc76f.x86_64
      nginx-filesystem-1:1.22.1-4.module_el9+666+132dc76f.noarch
      nginx-mod-http-image-filter-1:1.22.1-4.module_el9+666+132dc76f.x86_64
      nginx-mod-http-perl-1:1.22.1-4.module_el9+666+132dc76f.x86_64
      nginx-mod-http-xslt-filter-1:1.22.1-4.module_el9+666+132dc76f.x86_64
      nginx-mod-mail-1:1.22.1-4.module_el9+666+132dc76f.x86_64
      nginx-mod-stream-1:1.22.1-4.module_el9+666+132dc76f.x86_64

    Complete!