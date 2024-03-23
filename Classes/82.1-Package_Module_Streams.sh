##############################################################################################################
#### Discovery

[root@desk ~]# dnf module list
    Last metadata expiration check: 0:15:25 ago on Mon 11 Mar 2024 04:32:11 PM -03.
    CentOS Stream 9 - AppStream
    Name       Stream Profiles                          Summary
    mariadb    10.11  client, galera, server [d]        MariaDB Module
    maven      3.8    common [d]                        Java project management and project comprehension
                                                        tool
    nginx      1.22   common [d]                        nginx webserver
    nginx      1.24   common [d]                        nginx webserver
    nodejs     18     common [d], development, minimal, Javascript runtime
                       s2i
    nodejs     20     common [d], development, minimal, Javascript runtime
                       s2i
    php        8.1    common [d], devel, minimal        PHP scripting language
    php        8.2    common [d], devel, minimal        PHP scripting language
    postgresql 15     client, server [d]                PostgreSQL server and client module
    postgresql 16     client, server [d]                PostgreSQL server and client module
    redis      7      common [d]                        Redis persistent key-value database
    ruby       3.1    common [d]                        An interpreter of object-oriented scripting langua
                                                        ge
    ruby       3.3    common [d]                        An interpreter of object-oriented scripting langua
                                                        ge

    Hint: [d]efault, [e]nabled, [x]disabled, [i]nstalled

[root@desk ~]# dnf module list postgresql
    Last metadata expiration check: 0:16:11 ago on Mon 11 Mar 2024 04:32:11 PM -03.
    CentOS Stream 9 - AppStream
    Name               Stream         Profiles                  Summary
    postgresql         15             client, server [d]        PostgreSQL server and client module
    postgresql         16             client, server [d]        PostgreSQL server and client module       
    Hint: [d]efault, [e]nabled, [x]disabled, [i]nstalled

[root@desk ~]# dnf module info postgresql
    Last metadata expiration check: 0:16:41 ago on Mon 11 Mar 2024 04:32:11 PM -03.
    Name             : postgresql
    Stream           : 15
    Version          : 920230213093256
    Context          : rhel9
    Architecture     : x86_64
    Profiles         : client, server [d]
    Default profiles : server
    Repo             : appstream
    Summary          : PostgreSQL server and client module
    Description      : PostgreSQL is an advanced Object-Relational database management system (DBMS). The postgresql-server package contains the programs needed to create and run a PostgreSQL server, which will in turn allow you to create and maintain PostgreSQL databases. The base postgresql package contains the client programs that you'll need to access a PostgreSQL DBMS server.
    Requires         :
    Artifacts        : pg_repack-0:1.4.8-1.module_el9+264+92dde3f0.src
                     : pg_repack-0:1.4.8-1.module_el9+264+92dde3f0.x86_64
                     : pg_repack-debuginfo-0:1.4.8-1.module_el9+264+92dde3f0.x86_64
                     : pg_repack-debugsource-0:1.4.8-1.module_el9+264+92dde3f0.x86_64
                     : pgaudit-0:1.7.0-1.module_el9+264+92dde3f0.src
                     : pgaudit-0:1.7.0-1.module_el9+264+92dde3f0.x86_64
                     : pgaudit-debuginfo-0:1.7.0-1.module_el9+264+92dde3f0.x86_64
                     : pgaudit-debugsource-0:1.7.0-1.module_el9+264+92dde3f0.x86_64
                     : postgres-decoderbufs-0:1.9.7-1.Final.module_el9+264+92dde3f0.src
                     : postgres-decoderbufs-0:1.9.7-1.Final.module_el9+264+92dde3f0.x86_64
                     : postgres-decoderbufs-debuginfo-0:1.9.7-1.Final.module_el9+264+92dde3f0.x86_64
                     : postgres-decoderbufs-debugsource-0:1.9.7-1.Final.module_el9+264+92dde3f0.x86_64
                     : postgresql-0:15.2-1.module_el9+264+92dde3f0.src
                     : postgresql-0:15.2-1.module_el9+264+92dde3f0.x86_64
                     : postgresql-contrib-0:15.2-1.module_el9+264+92dde3f0.x86_64
                     : postgresql-contrib-debuginfo-0:15.2-1.module_el9+264+92dde3f0.x86_64
                     : postgresql-debuginfo-0:15.2-1.module_el9+264+92dde3f0.x86_64
                     : postgresql-debugsource-0:15.2-1.module_el9+264+92dde3f0.x86_64
                     : postgresql-docs-0:15.2-1.module_el9+264+92dde3f0.x86_64
                     : postgresql-docs-debuginfo-0:15.2-1.module_el9+264+92dde3f0.x86_64
                     : postgresql-plperl-0:15.2-1.module_el9+264+92dde3f0.x86_64
                     : postgresql-plperl-debuginfo-0:15.2-1.module_el9+264+92dde3f0.x86_64
                     : postgresql-plpython3-0:15.2-1.module_el9+264+92dde3f0.x86_64
                     : postgresql-plpython3-debuginfo-0:15.2-1.module_el9+264+92dde3f0.x86_64
                     : postgresql-pltcl-0:15.2-1.module_el9+264+92dde3f0.x86_64
                     : postgresql-pltcl-debuginfo-0:15.2-1.module_el9+264+92dde3f0.x86_64
                     : postgresql-private-devel-0:15.2-1.module_el9+264+92dde3f0.x86_64
                     : postgresql-private-libs-0:15.2-1.module_el9+264+92dde3f0.x86_64
                     : postgresql-private-libs-debuginfo-0:15.2-1.module_el9+264+92dde3f0.x86_64
                     : postgresql-server-0:15.2-1.module_el9+264+92dde3f0.x86_64
                     : postgresql-server-debuginfo-0:15.2-1.module_el9+264+92dde3f0.x86_64
                     : postgresql-server-devel-0:15.2-1.module_el9+264+92dde3f0.x86_64
                     : postgresql-server-devel-debuginfo-0:15.2-1.module_el9+264+92dde3f0.x86_64
                     : postgresql-static-0:15.2-1.module_el9+264+92dde3f0.x86_64
                     : postgresql-test-0:15.2-1.module_el9+264+92dde3f0.x86_64
                     : postgresql-test-debuginfo-0:15.2-1.module_el9+264+92dde3f0.x86_64
                     : postgresql-test-rpm-macros-0:15.2-1.module_el9+264+92dde3f0.noarch
                     : postgresql-upgrade-0:15.2-1.module_el9+264+92dde3f0.x86_64
                     : postgresql-upgrade-debuginfo-0:15.2-1.module_el9+264+92dde3f0.x86_64
                     : postgresql-upgrade-devel-0:15.2-1.module_el9+264+92dde3f0.x86_64
                     : postgresql-upgrade-devel-debuginfo-0:15.2-1.module_el9+264+92dde3f0.x86_64

    Name             : postgresql
    Stream           : 16
    Version          : 920240108131224
    Context          : rhel9
    Architecture     : x86_64
    Profiles         : client, server [d]
    Default profiles : server
    Repo             : appstream
    Summary          : PostgreSQL server and client module
    Description      : PostgreSQL is an advanced Object-Relational database management system (DBMS). The postgresql-server package contains the programs needed to create and run a PostgreSQL server, which will in turn allow you to create and maintain PostgreSQL databases. The base postgresql package contains the client programs that you'll need to access a PostgreSQL DBMS server.
    Requires         :
    Artifacts        : pg_repack-0:1.4.8-1.module_el9+807+b1de07f3.src
                     : pg_repack-0:1.4.8-1.module_el9+807+b1de07f3.x86_64
                     : pg_repack-debuginfo-0:1.4.8-1.module_el9+807+b1de07f3.x86_64
                     : pg_repack-debugsource-0:1.4.8-1.module_el9+807+b1de07f3.x86_64
                     : pgaudit-0:16.0-1.module_el9+807+b1de07f3.src
                     : pgaudit-0:16.0-1.module_el9+807+b1de07f3.x86_64
                     : pgaudit-debuginfo-0:16.0-1.module_el9+807+b1de07f3.x86_64
                     : pgaudit-debugsource-0:16.0-1.module_el9+807+b1de07f3.x86_64
                     : postgres-decoderbufs-0:2.4.0-1.Final.module_el9+807+b1de07f3.src
                     : postgres-decoderbufs-0:2.4.0-1.Final.module_el9+807+b1de07f3.x86_64
                     : postgres-decoderbufs-debuginfo-0:2.4.0-1.Final.module_el9+807+b1de07f3.x86_64
                     : postgres-decoderbufs-debugsource-0:2.4.0-1.Final.module_el9+807+b1de07f3.x86_64
                     : postgresql-0:16.1-1.module_el9+807+b1de07f3.src
                     : postgresql-0:16.1-1.module_el9+807+b1de07f3.x86_64
                     : postgresql-contrib-0:16.1-1.module_el9+807+b1de07f3.x86_64
                     : postgresql-contrib-debuginfo-0:16.1-1.module_el9+807+b1de07f3.x86_64
                     : postgresql-debuginfo-0:16.1-1.module_el9+807+b1de07f3.x86_64
                     : postgresql-debugsource-0:16.1-1.module_el9+807+b1de07f3.x86_64
                     : postgresql-docs-0:16.1-1.module_el9+807+b1de07f3.x86_64
                     : postgresql-docs-debuginfo-0:16.1-1.module_el9+807+b1de07f3.x86_64
                     : postgresql-plperl-0:16.1-1.module_el9+807+b1de07f3.x86_64
                     : postgresql-plperl-debuginfo-0:16.1-1.module_el9+807+b1de07f3.x86_64
                     : postgresql-plpython3-0:16.1-1.module_el9+807+b1de07f3.x86_64
                     : postgresql-plpython3-debuginfo-0:16.1-1.module_el9+807+b1de07f3.x86_64
                     : postgresql-pltcl-0:16.1-1.module_el9+807+b1de07f3.x86_64
                     : postgresql-pltcl-debuginfo-0:16.1-1.module_el9+807+b1de07f3.x86_64
                     : postgresql-private-devel-0:16.1-1.module_el9+807+b1de07f3.x86_64
                     : postgresql-private-libs-0:16.1-1.module_el9+807+b1de07f3.x86_64
                     : postgresql-private-libs-debuginfo-0:16.1-1.module_el9+807+b1de07f3.x86_64
                     : postgresql-server-0:16.1-1.module_el9+807+b1de07f3.x86_64
                     : postgresql-server-debuginfo-0:16.1-1.module_el9+807+b1de07f3.x86_64
                     : postgresql-server-devel-0:16.1-1.module_el9+807+b1de07f3.x86_64
                     : postgresql-server-devel-debuginfo-0:16.1-1.module_el9+807+b1de07f3.x86_64
                     : postgresql-static-0:16.1-1.module_el9+807+b1de07f3.x86_64
                     : postgresql-test-0:16.1-1.module_el9+807+b1de07f3.x86_64
                     : postgresql-test-debuginfo-0:16.1-1.module_el9+807+b1de07f3.x86_64
                     : postgresql-test-rpm-macros-0:16.1-1.module_el9+807+b1de07f3.noarch
                     : postgresql-upgrade-0:16.1-1.module_el9+807+b1de07f3.x86_64
                     : postgresql-upgrade-debuginfo-0:16.1-1.module_el9+807+b1de07f3.x86_64
                     : postgresql-upgrade-devel-0:16.1-1.module_el9+807+b1de07f3.x86_64
                     : postgresql-upgrade-devel-debuginfo-0:16.1-1.module_el9+807+b1de07f3.x86_64

    Hint: [d]efault, [e]nabled, [x]disabled, [i]nstalled, [a]ctive

[root@desk ~]# dnf module enable postgresql:15
    Last metadata expiration check: 0:17:30 ago on Mon 11 Mar 2024 04:32:11 PM -03.
    Dependencies resolved.
    ======================================================================================================
     Package                 Architecture           Version                 Repository               Size
    ======================================================================================================
    Enabling module streams:
     postgresql                                     15

    Transaction Summary
    ======================================================================================================

    Is this ok [y/N]: y
    Complete!

[root@desk ~]# dnf module list postgresql
    Last metadata expiration check: 0:17:43 ago on Mon 11 Mar 2024 04:32:11 PM -03.
    CentOS Stream 9 - AppStream
    Name               Stream         Profiles                  Summary
    postgresql         15 [e]         client, server [d]        PostgreSQL server and client module
    postgresql         16             client, server [d]        PostgreSQL server and client module

    Hint: [d]efault, [e]nabled, [x]disabled, [i]nstalled

[root@desk ~]# dnf module install postgresql
    Last metadata expiration check: 0:18:23 ago on Mon 11 Mar 2024 04:32:11 PM -03.
    Dependencies resolved.
    ======================================================================================================
     Package                      Arch        Version                                Repository      Size
    ======================================================================================================
    Installing group/module packages:
     postgresql-server            x86_64      15.2-1.module_el9+264+92dde3f0         appstream      6.1 M
    Installing dependencies:
     postgresql                   x86_64      15.2-1.module_el9+264+92dde3f0         appstream      1.7 M
     postgresql-private-libs      x86_64      15.2-1.module_el9+264+92dde3f0         appstream      138 k
    Installing module profiles:
     postgresql/server

    Transaction Summary
    ======================================================================================================
    Install  3 Packages

    Total download size: 8.0 M
    Installed size: 31 M
    Is this ok [y/N]: n
    Operation aborted.


[root@desk ~]# dnf module list postgresql
    Last metadata expiration check: 0:19:01 ago on Mon 11 Mar 2024 04:32:11 PM -03.
    CentOS Stream 9 - AppStream
    Name               Stream         Profiles                  Summary
    postgresql         15 [e]         client, server [d]        PostgreSQL server and client module
    postgresql         16             client, server [d]        PostgreSQL server and client module

    Hint: [d]efault, [e]nabled, [x]disabled, [i]nstalled

[root@desk ~]# dnf module enable postgresql:16
    Last metadata expiration check: 0:19:20 ago on Mon 11 Mar 2024 04:32:11 PM -03.
    Dependencies resolved.
    The operation would result in switching of module 'postgresql' stream '15' to stream '16'
    Error: It is not possible to switch enabled streams of a module unless explicitly enabled via configuration option module_stream_switch.
    It is recommended to rather remove all installed content from the module, and reset the module using 'dnf module reset <module_name>' command. After you reset the module, you can install the other stream.

[root@desk ~]# dnf module reset postgresql
    Last metadata expiration check: 0:20:01 ago on Mon 11 Mar 2024 04:32:11 PM -03.
    Dependencies resolved.
    ======================================================================================================
     Package                 Architecture           Version                 Repository               Size
    ======================================================================================================
    Resetting modules:
     postgresql

    Transaction Summary
    ======================================================================================================

    Is this ok [y/N]: y
    Complete!

[root@desk ~]# dnf module list postgresql
    Last metadata expiration check: 0:20:16 ago on Mon 11 Mar 2024 04:32:11 PM -03.
    CentOS Stream 9 - AppStream
    Name               Stream         Profiles                  Summary
    postgresql         15             client, server [d]        PostgreSQL server and client module
    postgresql         16             client, server [d]        PostgreSQL server and client module

    Hint: [d]efault, [e]nabled, [x]disabled, [i]nstalled

[root@desk ~]# dnf module instal postgresql
    usage: dnf module [-c [config file]] [-q] [-v] [--version] [--installroot [path]] [--nodocs]
                      [--noplugins] [--enableplugin [plugin]] [--disableplugin [plugin]]
                      [--releasever RELEASEVER] [--setopt SETOPTS] [--skip-broken] [-h] [--allowerasing]
                      [-b | --nobest] [-C] [-R [minutes]] [-d [debug level]] [--debugsolver]
                      [--showduplicates] [-e ERRORLEVEL] [--obsoletes]
                      [--rpmverbosity [debug level name]] [-y] [--assumeno] [--enablerepo [repo]]
                      [--disablerepo [repo] | --repo [repo]] [--enable | --disable] [-x [package]]
                      [--disableexcludes [repo]] [--repofrompath [repo,path]] [--noautoremove]
                      [--nogpgcheck] [--color COLOR] [--refresh] [-4] [-6] [--destdir DESTDIR]
                      [--downloadonly] [--comment COMMENT] [--bugfix] [--enhancement] [--newpackage]
                      [--security] [--advisory ADVISORY] [--bz BUGZILLA] [--cve CVES]
                      [--sec-severity {Critical,Important,Moderate,Low}] [--forcearch ARCH] [--enabled]
                      [--disabled] [--installed] [--profile] [--available] [--all]
                      <modular command> [module-spec ...]
    dnf module: error: argument <modular command>: invalid choice: 'instal' (choose from 'disable', 'enable', 'info', 'install', 'list', 'provides', 'remove', 'repoquery', 'reset', 'switch-to', 'update')

[root@desk ~]# dnf module install postgresql
    Last metadata expiration check: 0:20:51 ago on Mon 11 Mar 2024 04:32:11 PM -03.
    Argument 'postgresql' matches 2 streams ('15', '16') of module 'postgresql', but none of the streams are enabled or default
    Unable to resolve argument postgresql
    Error: Problems in request:
    broken groups or modules: postgresql

[root@desk ~]# dnf module enable postgresql:16
    Last metadata expiration check: 0:22:22 ago on Mon 11 Mar 2024 04:32:11 PM -03.
    Dependencies resolved.
    ======================================================================================================
     Package                 Architecture           Version                 Repository               Size
    ======================================================================================================
    Enabling module streams:
     postgresql                                     16

    Transaction Summary
    ======================================================================================================

    Is this ok [y/N]: y
    Complete!

[root@desk ~]# dnf module list postgresql
    Last metadata expiration check: 0:22:35 ago on Mon 11 Mar 2024 04:32:11 PM -03.
    CentOS Stream 9 - AppStream
    Name               Stream         Profiles                  Summary
    postgresql         15             client, server [d]        PostgreSQL server and client module
    postgresql         16 [e]         client, server [d]        PostgreSQL server and client module

    Hint: [d]efault, [e]nabled, [x]disabled, [i]nstalled

[root@desk ~]# dnf module install postgresql
    Last metadata expiration check: 0:23:07 ago on Mon 11 Mar 2024 04:32:11 PM -03.
    Dependencies resolved.
    ======================================================================================================
     Package                      Arch        Version                                Repository      Size
    ======================================================================================================
    Installing group/module packages:
     postgresql-server            x86_64      16.1-1.module_el9+807+b1de07f3         appstream      7.0 M
    Installing dependencies:
     postgresql                   x86_64      16.1-1.module_el9+807+b1de07f3         appstream      1.9 M
     postgresql-private-libs      x86_64      16.1-1.module_el9+807+b1de07f3         appstream      142 k
    Installing module profiles:
     postgresql/server

    Transaction Summary
    ======================================================================================================
    Install  3 Packages

    Total download size: 9.0 M
    Installed size: 37 M
    Is this ok [y/N]: y
    Downloading Packages:
    ^C-3/3): postgresql-server-16.1  0% [                               ] 107 kB/s |  48 kB     01:25 ETA
    The downloaded packages were saved in cache until the next successful transaction.
    You can remove cached packages by executing 'dnf clean packages'.
    Error: Error downloading packages:
      Interrupted by a SIGINT signal

[root@desk ~]# dnf module reset postgresql
    Last metadata expiration check: 0:23:32 ago on Mon 11 Mar 2024 04:32:11 PM -03.
    Dependencies resolved.
    ======================================================================================================
     Package                 Architecture           Version                 Repository               Size
    ======================================================================================================
    Resetting modules:
     postgresql

    Transaction Summary
    ======================================================================================================

    Is this ok [y/N]: y
    Complete!

[root@desk ~]# dnf module list postgresql
    Last metadata expiration check: 0:23:44 ago on Mon 11 Mar 2024 04:32:11 PM -03.
    CentOS Stream 9 - AppStream
    Name               Stream         Profiles                  Summary
    postgresql         15             client, server [d]        PostgreSQL server and client module
    postgresql         16             client, server [d]        PostgreSQL server and client module

    Hint: [d]efault, [e]nabled, [x]disabled, [i]nstalled

[root@desk ~]# dnf module enable postgresql:15

[root@desk ~]# dnf module install postgresql
    Last metadata expiration check: 0:29:10 ago on Mon 11 Mar 2024 04:32:11 PM -03.
    Dependencies resolved.
    ======================================================================================================
     Package                      Arch        Version                                Repository      Size
    ======================================================================================================
    Installing group/module packages:
     postgresql-server            x86_64      15.2-1.module_el9+264+92dde3f0         appstream      6.1 M
    Installing dependencies:
     postgresql                   x86_64      15.2-1.module_el9+264+92dde3f0         appstream      1.7 M
     postgresql-private-libs      x86_64      15.2-1.module_el9+264+92dde3f0         appstream      138 k
    Installing module profiles:
     postgresql/server

    Transaction Summary
    ======================================================================================================
    Install  3 Packages

    Total download size: 8.0 M
    Installed size: 31 M
    Is this ok [y/N]: y
    Downloading Packages:
    (1/3): postgresql-private-libs-15.2-1.module_el9+264+92dde3f0.x86_64.  56 kB/s | 138 kB     00:02
    (2/3): postgresql-15.2-1.module_el9+264+92dde3f0.x86_64.rpm           426 kB/s | 1.7 MB     00:04
    (3/3): postgresql-server-15.2-1.module_el9+264+92dde3f0.x86_64.rpm    1.1 MB/s | 6.1 MB     00:05
    ------------------------------------------------------------------------------------------------------
    Total                                                                 1.1 MB/s | 8.0 MB     00:07
    Running transaction check
    Transaction check succeeded.
    Running transaction test
    Transaction test succeeded.
    Running transaction
      Preparing        :                                                                              1/1
      Installing       : postgresql-private-libs-15.2-1.module_el9+264+92dde3f0.x86_64                1/3
      Installing       : postgresql-15.2-1.module_el9+264+92dde3f0.x86_64                             2/3
      Running scriptlet: postgresql-server-15.2-1.module_el9+264+92dde3f0.x86_64                      3/3
      Installing       : postgresql-server-15.2-1.module_el9+264+92dde3f0.x86_64                      3/3   Running scriptlet: postgresql-server-15.2-1.module_el9+264+92dde3f0.x86_64                      3/3
      Verifying        : postgresql-15.2-1.module_el9+264+92dde3f0.x86_64                             1/3   Verifying        : postgresql-private-libs-15.2-1.module_el9+264+92dde3f0.x86_64                2/3
      Verifying        : postgresql-server-15.2-1.module_el9+264+92dde3f0.x86_64                      3/3

    Installed:
      postgresql-15.2-1.module_el9+264+92dde3f0.x86_64
      postgresql-private-libs-15.2-1.module_el9+264+92dde3f0.x86_64
      postgresql-server-15.2-1.module_el9+264+92dde3f0.x86_64

    Complete!

[root@desk ~]# dnf module remove --all postgresql
    Last metadata expiration check: 0:30:52 ago on Mon 11 Mar 2024 04:32:11 PM -03.
    Dependencies resolved.
    ======================================================================================================
     Package                      Arch        Version                               Repository       Size
    ======================================================================================================
    Removing:
     postgresql                   x86_64      15.2-1.module_el9+264+92dde3f0        @appstream      6.5 M
     postgresql-private-libs      x86_64      15.2-1.module_el9+264+92dde3f0        @appstream      339 k
     postgresql-server            x86_64      15.2-1.module_el9+264+92dde3f0        @appstream       25 M
    Disabling module profiles:
     postgresql/server

    Transaction Summary
    ======================================================================================================
    Remove  3 Packages

    Freed space: 31 M
    Is this ok [y/N]: y
    Running transaction check
    Transaction check succeeded.
    Running transaction test
    Transaction test succeeded.
    Running transaction
      Preparing        :                                                                              1/1
      Running scriptlet: postgresql-server-15.2-1.module_el9+264+92dde3f0.x86_64                      1/3
      Erasing          : postgresql-server-15.2-1.module_el9+264+92dde3f0.x86_64                      1/3
      Running scriptlet: postgresql-server-15.2-1.module_el9+264+92dde3f0.x86_64                      1/3
      Erasing          : postgresql-15.2-1.module_el9+264+92dde3f0.x86_64                             2/3
      Erasing          : postgresql-private-libs-15.2-1.module_el9+264+92dde3f0.x86_64                3/3
      Running scriptlet: postgresql-private-libs-15.2-1.module_el9+264+92dde3f0.x86_64                3/3
      Verifying        : postgresql-15.2-1.module_el9+264+92dde3f0.x86_64                             1/3
      Verifying        : postgresql-private-libs-15.2-1.module_el9+264+92dde3f0.x86_64                2/3
      Verifying        : postgresql-server-15.2-1.module_el9+264+92dde3f0.x86_64                      3/3

    Removed:
      postgresql-15.2-1.module_el9+264+92dde3f0.x86_64
      postgresql-private-libs-15.2-1.module_el9+264+92dde3f0.x86_64
      postgresql-server-15.2-1.module_el9+264+92dde3f0.x86_64

    Complete!
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
