##############################################################################################################
#### NTP
[root@desk ~]# timedatectl
                   Local time: Sun 2024-03-10 23:56:45 -03
               Universal time: Mon 2024-03-11 02:56:45 UTC
                     RTC time: Mon 2024-03-11 02:56:45
                    Time zone: America/Sao_Paulo (-03, -0300)
    System clock synchronized: yes
                  NTP service: active
              RTC in local TZ: no

[root@desk ~]# timedatectl --help
    timedatectl [OPTIONS...] COMMAND ...

    Query or change system time and date settings.

    Commands:
      status                   Show current time settings
      show                     Show properties of systemd-timedated
      set-time TIME            Set system time
      set-timezone ZONE        Set system time zone
      list-timezones           Show known time zones
      set-local-rtc BOOL       Control whether RTC is in local time
      set-ntp BOOL             Enable or disable network time synchronization

    systemd-timesyncd Commands:
      timesync-status          Show status of systemd-timesyncd
      show-timesync            Show properties of systemd-timesyncd

    Options:
      -h --help                Show this help message
         --version             Show package version
         --no-pager            Do not pipe output into a pager
         --no-ask-password     Do not prompt for password
      -H --host=[USER@]HOST    Operate on remote host
      -M --machine=CONTAINER   Operate on local container
         --adjust-system-clock Adjust system clock when changing local RTC mode
         --monitor             Monitor status of systemd-timesyncd
      -p --property=NAME       Show only properties by this name
      -a --all                 Show all properties, including empty ones
         --value               When showing properties, only print the value

    See the timedatectl(1) man page for details.



[root@desk ~]# timedatectl list-timezones | grep New_York
    America/New_York


[root@desk ~]# timedatectl set-timezone America/New_York

[root@desk ~]# timedatectl
                   Local time: Sun 2024-03-10 22:59:24 EDT
               Universal time: Mon 2024-03-11 02:59:24 UTC
                     RTC time: Mon 2024-03-11 02:59:25
                    Time zone: America/New_York (EDT, -0400)
    System clock synchronized: yes
                  NTP service: active
              RTC in local TZ: no

[root@desk ~]# timedatectl list-timezones | grep Sao
    Africa/Sao_Tome
    America/Sao_Paulo

[root@desk ~]# timedatectl set-timezone America/Sao_Paulo

[root@desk ~]# timedatectl
                   Local time: Mon 2024-03-11 00:00:57 -03
               Universal time: Mon 2024-03-11 03:00:57 UTC
                     RTC time: Mon 2024-03-11 03:00:57
                    Time zone: America/Sao_Paulo (-03, -0300)
    System clock synchronized: yes
                  NTP service: active
              RTC in local TZ: no


[root@desk ~]# timedatectl -help
    timedatectl [OPTIONS...] COMMAND ...

    Query or change system time and date settings.

    Commands:
      status                   Show current time settings
      show                     Show properties of systemd-timedated
      set-time TIME            Set system time
      set-timezone ZONE        Set system time zone
      list-timezones           Show known time zones
      set-local-rtc BOOL       Control whether RTC is in local time
      set-ntp BOOL             Enable or disable network time synchronization

    systemd-timesyncd Commands:
      timesync-status          Show status of systemd-timesyncd
      show-timesync            Show properties of systemd-timesyncd

    Options:
      -h --help                Show this help message
         --version             Show package version
         --no-pager            Do not pipe output into a pager
         --no-ask-password     Do not prompt for password
      -H --host=[USER@]HOST    Operate on remote host
      -M --machine=CONTAINER   Operate on local container
         --adjust-system-clock Adjust system clock when changing local RTC mode
         --monitor             Monitor status of systemd-timesyncd
      -p --property=NAME       Show only properties by this name
      -a --all                 Show all properties, including empty ones
         --value               When showing properties, only print the value

    See the timedatectl(1) man page for details.


[root@desk ~]# timedatectl set-ntp 0

[root@desk ~]# timedatectl
                   Local time: Mon 2024-03-11 00:03:07 -03
               Universal time: Mon 2024-03-11 03:03:07 UTC
                     RTC time: Mon 2024-03-11 03:03:07
                    Time zone: America/Sao_Paulo (-03, -0300)
    System clock synchronized: yes
                  NTP service: inactive
              RTC in local TZ: no

[root@desk ~]# timedatectl set-ntp 1

[root@desk ~]# timedatectl
                   Local time: Mon 2024-03-11 00:03:18 -03
               Universal time: Mon 2024-03-11 03:03:18 UTC
                     RTC time: Mon 2024-03-11 03:03:18
                    Time zone: America/Sao_Paulo (-03, -0300)
    System clock synchronized: yes
                  NTP service: active
              RTC in local TZ: no

# On the exam the only task that maybe will be required is to add a NTP server
# You can do that by adding a new row with the server provided in the exam.
# e.g.  
    # pool 3.centos.pool.ntp.org iburst
# Don't forget of restart the service chronyd
# systemctl restart chronyd
[root@desk ~]# cat /etc/chrony.conf
    # Use public servers from the pool.ntp.org project.
    # Please consider joining the pool (https://www.pool.ntp.org/join.html).
    pool 2.centos.pool.ntp.org iburst

    # Use NTP servers from DHCP.
    sourcedir /run/chrony-dhcp

    # Record the rate at which the system clock gains/losses time.
    driftfile /var/lib/chrony/drift

    # Allow the system clock to be stepped in the first three updates
    # if its offset is larger than 1 second.
    makestep 1.0 3

    # Enable kernel synchronization of the real-time clock (RTC).
    rtcsync

    # Enable hardware timestamping on all interfaces that support it.
    #hwtimestamp *

    # Increase the minimum number of selectable sources required to adjust
    # the system clock.
    #minsources 2

    # Allow NTP client access from local network.
    #allow 192.168.0.0/16

    # Serve time even if not synchronized to a time source.
    #local stratum 10

    # Require authentication (nts or key option) for all NTP sources.
    #authselectmode require

    # Specify file containing keys for NTP authentication.
    keyfile /etc/chrony.keys

    # Save NTS keys and cookies.
    ntsdumpdir /var/lib/chrony

    # Insert/delete leap seconds by slewing instead of stepping.
    #leapsecmode slew

    # Get TAI-UTC offset and leap seconds from the system tz database.
    leapsectz right/UTC

    # Specify directory for log files.
    logdir /var/log/chrony

    # Select which information is logged.
    #log measurements statistics tracking

[root@desk ~]# date
    Mon Mar 11 12:09:18 AM -03 2024
[root@desk ~]# date '+%s'
    1710126570
[root@desk ~]# date -d '@1710126570'
    Mon Mar 11 12:09:30 AM -03 2024
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
