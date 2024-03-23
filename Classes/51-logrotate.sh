[root@desk ~]# man logrotate

[root@desk ~]# cat /etc/logrotate.conf
    # see "man logrotate" for details

    # global options do not affect preceding include directives

    # rotate log files weekly
    weekly

    # keep 4 weeks worth of backlogs
    rotate 4

    # create new (empty) log files after rotating old ones
    create

    # use date as a suffix of the rotated file
    dateext

    # uncomment this if you want your log files compressed
    #compress

    # packages drop log rotation information into this directory
    include /etc/logrotate.d

    # system-specific logs may be also be configured here.

[root@desk ~]# vi /etc/logrotate.d/comprimido

    ->> Add the following:
    compress

[root@desk ~]# cat /etc/logrotate.conf
    # see "man logrotate" for details

    # global options do not affect preceding include directives

    # rotate log files weekly
    weekly

    # keep 4 weeks worth of backlogs
    rotate 4

    # create new (empty) log files after rotating old ones
    create

    # use date as a suffix of the rotated file
    dateext

    # uncomment this if you want your log files compressed
    #compress

    # packages drop log rotation information into this directory
    include /etc/logrotate.d

    # system-specific logs may be also be configured here.

    --> compress was specified in /etc/logrotate.d/comprimido and the information contained
    in this file will ovewritten with that. as specified in line 54 and refer to 'man logrotate' command 






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
