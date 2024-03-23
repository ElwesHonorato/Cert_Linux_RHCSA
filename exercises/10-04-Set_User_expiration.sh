# Expire a conta da tina daqui a 90 dias

[root@dev1 ~]# chage -h
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

# Get the code snippet " chage -E $(date -d +90days +%Y-%m-%d) " from man chage
[root@dev1 ~]# man chage
[root@dev1 ~]# chage -E $(date -d +90days +%Y-%m-%d) tina
[root@dev1 ~]# chage -l tina
    Last password change                                    : Mar 17, 2024
    Password expires                                        : never
    Password inactive                                       : never
    Account expires                                         : Jun 15, 2024
    Minimum number of days between password change          : 0
    Maximum number of days between password change          : 99999
    Number of days of warning before password expires       : 7