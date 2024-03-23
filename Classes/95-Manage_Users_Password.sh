##############################################################################################################
#### Discovery
[root@dev1 ~]# tail /etc/passwd
    rpcuser:x:29:29:RPC Service User:/var/lib/nfs:/sbin/nologin
    sshd:x:74:74:Privilege-separated SSH:/usr/share/empty.sshd:/usr/sbin/nologin
    chrony:x:981:979:chrony system user:/var/lib/chrony:/sbin/nologin
    dnsmasq:x:980:978:Dnsmasq DHCP and DNS server:/var/lib/dnsmasq:/usr/sbin/nologin
    tcpdump:x:72:72::/:/sbin/nologin
    elwes:x:1000:1000:elwes:/home/elwes:/bin/bash
    mike:x:1001:1001::/home/mike:/bin/bash
    nginx:x:979:977:Nginx web server:/var/lib/nginx:/sbin/nologin
    apache:x:48:48:Apache:/usr/share/httpd:/sbin/nologin
    bia:x:2400:3000::/home/bia:/bin/bash

[root@dev1 ~]# chage -l bia
    Last password change                                    : Mar 16, 2024
    Password expires                                        : never
    Password inactive                                       : never
    Account expires                                         : never
    Minimum number of days between password change          : 0
    Maximum number of days between password change          : 99999
    Number of days of warning before password expires       : 7

[root@dev1 ~]# chage
    Usage: chage [options] LOGIN

    Options:
      -d, --lastday LAST_DAY        set date of last password change to LAST_DAY
      -E, --expiredate EXPIRE_DATE  set account expiration date to EXPIRE_DATE
      -h, --help                    display this help message and exit
      -i, --iso8601                 use YYYY-MM-DD when printing dates
      -I, --inactive INACTIVE       set password inactive after expiration
                                    to INACTIVE
      -l, --list                    show account aging information
      -m, --mindays MIN_DAYS        set minimum number of days before password
                                    change to MIN_DAYS
      -M, --maxdays MAX_DAYS        set maximum number of days before password
                                    change to MAX_DAYS
      -R, --root CHROOT_DIR         directory to chroot into
      -W, --warndays WARN_DAYS      set expiration warning days to WARN_DAYS


[root@dev1 ~]# date -d "+90 days"
    Fri Jun 14 11:39:56 AM -03 2024

[root@dev1 ~]# man chage

[root@dev1 ~]# date -d "+90 days" +%Y-%m-%d
    2024-06-14

[root@dev1 ~]# chage -E $(date -d "+90 days" +%Y-%m-%d) bia

[root@dev1 ~]# chage -l bia
    Last password change                                    : Mar 16, 2024
    Password expires                                        : never
    Password inactive                                       : never
    Account expires                                         : Jun 14, 2024
    Minimum number of days between password change          : 0
    Maximum number of days between password change          : 99999
    Number of days of warning before password expires       : 7

[root@dev1 ~]# chage -M 90 bia

[root@dev1 ~]# chage -l bia
    Last password change                                    : Mar 16, 2024
    Password expires                                        : Jun 14, 2024
    Password inactive                                       : never
    Account expires                                         : Jun 14, 2024
    Minimum number of days between password change          : 0
    Maximum number of days between password change          : 90
    Number of days of warning before password expires       : 7

[root@dev1 ~]# chage -W 3 bia

[root@dev1 ~]# chage -l bia
    Last password change                                    : Mar 16, 2024
    Password expires                                        : Jun 14, 2024
    Password inactive                                       : never
    Account expires                                         : Jun 14, 2024
    Minimum number of days between password change          : 0
    Maximum number of days between password change          : 90
    Number of days of warning before password expires       : 3


[root@dev1 ~]# chage bia
Changing the aging information for bia
Enter the new value, or press ENTER for the default

        Minimum Password Age [0]: 10
        Maximum Password Age [90]:
        Last Password Change (YYYY-MM-DD) [2024-03-16]:
        Password Expiration Warning [3]:
        Password Inactive [-1]:
        Account Expiration Date (YYYY-MM-DD) [2024-06-14]:

[root@dev1 ~]# chage -l bia
    Last password change                                    : Mar 16, 2024
    Password expires                                        : Jun 14, 2024
    Password inactive                                       : never
    Account expires                                         : Jun 14, 2024
    Minimum number of days between password change          : 10
    Maximum number of days between password change          : 90
    Number of days of warning before password expires       : 3

[root@dev1 ~]# chage -d 0 bia

[root@dev1 ~]# chage -l bia
    Last password change                                    : password must be changed
    Password expires                                        : password must be changed
    Password inactive                                       : password must be changed
    Account expires                                         : Jun 14, 2024
    Minimum number of days between password change          : 10
    Maximum number of days between password change          : 90
    Number of days of warning before password expires       : 3














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
