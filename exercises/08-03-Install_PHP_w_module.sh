# Instale o PHP última versão disponível
[root@dev1 ~]# dnf module list php
    Last metadata expiration check: 0:04:47 ago on Tue 12 Mar 2024 12:42:53 AM -03.
    Lab 8 - Local Repo - Appstream
    Name            Stream           Profiles                             Summary
    php             8.1              common [d], devel, minimal           PHP scripting language
    php             8.2              common [d], devel, minimal           PHP scripting language

    CentOS Stream 9 - AppStream
    Name            Stream           Profiles                             Summary
    php             8.1              common [d], devel, minimal           PHP scripting language
    php             8.2              common [d], devel, minimal           PHP scripting language

    my_appstream
    Name            Stream           Profiles                             Summary
    php             8.1              common [d], devel, minimal           PHP scripting language
    php             8.2              common [d], devel, minimal           PHP scripting language

    Hint: [d]efault, [e]nabled, [x]disabled, [i]nstalled

[root@dev1 ~]# dnf module enable php:8.2
    Last metadata expiration check: 0:05:27 ago on Tue 12 Mar 2024 12:42:53 AM -03.
    Dependencies resolved.
    ======================================================================================================
     Package                 Architecture           Version                 Repository               Size
    ======================================================================================================
    Enabling module streams:
     php                                            8.2

    Transaction Summary
    ======================================================================================================
    Is this ok [y/N]: y
    Complete!

[root@dev1 ~]# dnf module install php
    Last metadata expiration check: 0:05:38 ago on Tue 12 Mar 2024 12:42:53 AM -03.
    Dependencies resolved.
    ======================================================================================================
     Package                 Architecture  Version                                 Repository        Size
    ======================================================================================================
    Installing group/module packages:
     php-cli                 x86_64        8.2.13-1.module_el9+766+427f1f3d        appstream        3.6 M
     php-common              x86_64        8.2.13-1.module_el9+766+427f1f3d        appstream        699 k
     php-fpm                 x86_64        8.2.13-1.module_el9+766+427f1f3d        appstream        1.8 M
     php-mbstring            x86_64        8.2.13-1.module_el9+766+427f1f3d        appstream        522 k
     php-xml                 x86_64        8.2.13-1.module_el9+766+427f1f3d        appstream        146 k
    Installing dependencies:
     httpd-filesystem        noarch        2.4.57-8.el9                            appstream         13 k
    Installing module profiles:
     php/common

    Transaction Summary
    ======================================================================================================
    Install  6 Packages

    Total download size: 6.8 M
    Installed size: 34 M
    Is this ok [y/N]: y
    Downloading Packages:
    (1/6): httpd-filesystem-2.4.57-8.el9.noarch.rpm                       9.5 kB/s |  13 kB     00:01
    (2/6): php-common-8.2.13-1.module_el9+766+427f1f3d.x86_64.rpm         282 kB/s | 699 kB     00:02
    (3/6): php-fpm-8.2.13-1.module_el9+766+427f1f3d.x86_64.rpm            929 kB/s | 1.8 MB     00:02
    (4/6): php-mbstring-8.2.13-1.module_el9+766+427f1f3d.x86_64.rpm       396 kB/s | 522 kB     00:01
    (5/6): php-xml-8.2.13-1.module_el9+766+427f1f3d.x86_64.rpm            117 kB/s | 146 kB     00:01
    (6/6): php-cli-8.2.13-1.module_el9+766+427f1f3d.x86_64.rpm            669 kB/s | 3.6 MB     00:05
    ------------------------------------------------------------------------------------------------------
    Total                                                                 1.0 MB/s | 6.8 MB     00:06
    Running transaction check
    Transaction check succeeded.
    Running transaction test
    Transaction test succeeded.
    Running transaction
      Preparing        :                                                                              1/1
      Installing       : php-common-8.2.13-1.module_el9+766+427f1f3d.x86_64                           1/6
      Running scriptlet: httpd-filesystem-2.4.57-8.el9.noarch                                         2/6
      Installing       : httpd-filesystem-2.4.57-8.el9.noarch                                         2/6
      Installing       : php-fpm-8.2.13-1.module_el9+766+427f1f3d.x86_64                              3/6
      Running scriptlet: php-fpm-8.2.13-1.module_el9+766+427f1f3d.x86_64                              3/6
      Installing       : php-cli-8.2.13-1.module_el9+766+427f1f3d.x86_64                              4/6
      Installing       : php-mbstring-8.2.13-1.module_el9+766+427f1f3d.x86_64                         5/6
      Installing       : php-xml-8.2.13-1.module_el9+766+427f1f3d.x86_64                              6/6
      Running scriptlet: php-xml-8.2.13-1.module_el9+766+427f1f3d.x86_64                              6/6
      Verifying        : httpd-filesystem-2.4.57-8.el9.noarch                                         1/6
      Verifying        : php-cli-8.2.13-1.module_el9+766+427f1f3d.x86_64                              2/6
      Verifying        : php-common-8.2.13-1.module_el9+766+427f1f3d.x86_64                           3/6
      Verifying        : php-fpm-8.2.13-1.module_el9+766+427f1f3d.x86_64                              4/6
      Verifying        : php-mbstring-8.2.13-1.module_el9+766+427f1f3d.x86_64                         5/6
      Verifying        : php-xml-8.2.13-1.module_el9+766+427f1f3d.x86_64                              6/6

    Installed:
      httpd-filesystem-2.4.57-8.el9.noarch
      php-cli-8.2.13-1.module_el9+766+427f1f3d.x86_64
      php-common-8.2.13-1.module_el9+766+427f1f3d.x86_64
      php-fpm-8.2.13-1.module_el9+766+427f1f3d.x86_64
      php-mbstring-8.2.13-1.module_el9+766+427f1f3d.x86_64
      php-xml-8.2.13-1.module_el9+766+427f1f3d.x86_64

    Complete!