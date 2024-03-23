# bob tem que mudar o password dele no próximo login

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


[root@dev1 ~]# chage -d 0 bob
[root@dev1 ~]# chage -l bob
    Last password change                                    : password must be changed
    Password expires                                        : password must be changed
    Password inactive                                       : password must be changed
    Account expires                                         : never
    Minimum number of days between password change          : 0
    Maximum number of days between password change          : 99999
    Number of days of warning before password expires       : 7

