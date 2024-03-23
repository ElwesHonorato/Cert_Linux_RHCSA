##############################################################################################################
#### at

[root@dev1 ~]# dnf install -y at
 
[root@dev1 ~]#  systemctl status atd
  ● atd.service - Deferred execution scheduler
       Loaded: loaded (/usr/lib/systemd/system/atd.service; enabled; preset: enabled)
       Active: active (running) since Sun 2024-03-10 15:37:08 -03; 2min 40s ago
         Docs: man:atd(8)
     Main PID: 1159 (atd)
        Tasks: 1 (limit: 10812)
       Memory: 300.0K
          CPU: 9ms
       CGroup: /system.slice/atd.service
               └─1159 /usr/sbin/atd -f

  Mar 10 15:37:08 dev1.temweb.local systemd[1]: Started Deferred execution scheduler.

[root@dev1 ~]# systemctl is-enabled atd
  enabled

[root@dev1 ~]# at now + 2 minutes
  warning: commands will be executed using /bin/sh
  at> echo "Hello At" > /root/atTest/myAt
  at>
  at> <EOT>
  job 3 at Sun Mar 10 15:45:00 2024

[root@dev1 ~]# atq
  3       Sun Mar 10 15:45:00 2024 a root

[root@dev1 ~]# cd /root/atTest/

[root@dev1 atTest]# ls -ltr
  total 4
  -rw-r--r--. 1 root root 9 Mar 10 15:45 myAt

[root@dev1 atTest]# at now + 10 minutes
  warning: commands will be executed using /bin/sh
  at> echo "Another Test" >> /root/atTest/myAt
  at> <EOT>
  job 4 at Sun Mar 10 15:56:00 2024

[root@dev1 atTest]# ls -ltr
    total 4
    -rw-r--r--. 1 root root 9 Mar 10 15:45 myAt

[root@dev1 atTest]# atq
  4       Sun Mar 10 15:56:00 2024 a root

[root@dev1 atTest]# ps aux | grep atd
  root        1159  0.0  0.1   4672  2432 ?        Ss   15:37   0:00 /usr/sbin/atd -f
  root        1721  0.0  0.1 221664  2432 pts/0    S+   15:51   0:00 grep --color=auto atd

[root@dev1 atTest]# ps aux | grep atd
  root        1725  0.0  0.1 221664  2432 pts/0    S+   15:51   0:00 grep --color=auto atd

[root@dev1 atTest]# systemctl status atd
  × atd.service - Deferred execution scheduler
       Loaded: loaded (/usr/lib/systemd/system/atd.service; enabled; preset: enabled)
       Active: failed (Result: signal) since Sun 2024-03-10 15:51:39 -03; 28s ago
     Duration: 14min 31.057s
         Docs: man:atd(8)
      Process: 1159 ExecStart=/usr/sbin/atd -f $OPTS (code=killed, signal=KILL)
     Main PID: 1159 (code=killed, signal=KILL)
          CPU: 29ms

  Mar 10 15:37:08 dev1.temweb.local systemd[1]: Started Deferred execution scheduler.
  Mar 10 15:45:00 dev1.temweb.local atd[1698]: Starting job 3 (a0000301b2e665) for user 'root' (0)
  Mar 10 15:45:00 dev1.temweb.local atd[1698]: pam_unix(atd:session): session opened for user root(uid=>
  Mar 10 15:45:00 dev1.temweb.local atd[1698]: pam_unix(atd:session): session closed for user root
  Mar 10 15:51:39 dev1.temweb.local systemd[1]: atd.service: Main process exited, code=killed, status=9>
  Mar 10 15:51:39 dev1.temweb.local systemd[1]: atd.service: Failed with result 'signal'.
  lines 1-15/15 (END)

[root@dev1 atTest]# systemctl start atd
[root@dev1 atTest]# systemctl status atd
  ● atd.service - Deferred execution scheduler
       Loaded: loaded (/usr/lib/systemd/system/atd.service; enabled; preset: enabled)
       Active: active (running) since Sun 2024-03-10 15:52:24 -03; 3s ago
         Docs: man:atd(8)
     Main PID: 1732 (atd)
        Tasks: 1 (limit: 10812)
       Memory: 284.0K
          CPU: 6ms
       CGroup: /system.slice/atd.service
               └─1732 /usr/sbin/atd -f

  Mar 10 15:52:24 dev1.temweb.local systemd[1]: Started Deferred execution scheduler.
  Mar 10 15:52:24 dev1.temweb.local atd[1732]: Removing stale lockfile for pid 1159


[root@dev1 atTest]# atq
  4       Sun Mar 10 15:56:00 2024 a root
[root@dev1 atTest]# atrm 4
[root@dev1 atTest]# atq


##############################################################################################################
#### cron
[root@dev1 atTest]# systemctl status crond
  ● crond.service - Command Scheduler
       Loaded: loaded (/usr/lib/systemd/system/crond.service; enabled; preset: enabled)
       Active: active (running) since Sun 2024-03-10 15:37:08 -03; 17min ago
     Main PID: 1160 (crond)
        Tasks: 1 (limit: 10812)
       Memory: 1.0M
          CPU: 16ms
       CGroup: /system.slice/crond.service
               └─1160 /usr/sbin/crond -n

  Mar 10 15:37:08 dev1.temweb.local systemd[1]: Started Command Scheduler.
  Mar 10 15:37:08 dev1.temweb.local crond[1160]: (CRON) STARTUP (1.5.7)
  Mar 10 15:37:08 dev1.temweb.local crond[1160]: (CRON) INFO (Syslog will be used instead of sendmail.)
  Mar 10 15:37:08 dev1.temweb.local crond[1160]: (CRON) INFO (RANDOM_DELAY will be scaled with factor 6>
  Mar 10 15:37:08 dev1.temweb.local crond[1160]: (CRON) INFO (running with inotify support)
  lines 1-15/15 (END)

[root@dev1 atTest]# cat /etc/crontab
  SHELL=/bin/bash
  PATH=/sbin:/bin:/usr/sbin:/usr/bin
  MAILTO=root

  # For details see man 4 crontabs

  # Example of job definition:
  # .---------------- minute (0 - 59)
  # |  .------------- hour (0 - 23)
  # |  |  .---------- day of month (1 - 31)
  # |  |  |  .------- month (1 - 12) OR jan,feb,mar,apr ...
  # |  |  |  |  .---- day of week (0 - 6) (Sunday=0 or 7) OR sun,mon,tue,wed,thu,fri,sat
  # |  |  |  |  |
  # *  *  *  *  * user-name  command to be executed

[root@dev1 atTest]# crontab -h
  crontab: invalid option -- 'h'
  crontab: usage error: unrecognized option
  Usage:
   crontab [options] file
   crontab [options]
   crontab -n [hostname]

  Options:
   -u <user>  define user
   -e         edit user''s crontab
   -l         list user''s crontab
   -r         delete user''s crontab
   -i         prompt before deleting
   -n <host>  set host in cluster to run users'' crontabs
   -c         get host in cluster to run users'' crontabs
   -T <file>  test a crontab file syntax
   -s         selinux context
   -V         print version and exit
   -x <mask>  enable debugging

  Default operation is replace, per 1003.2

[root@dev1 atTest]# useradd mike
[root@dev1 atTest]# crontab -e -u mike
  no crontab for mike - using an empty one
  ^[[Acrontab: installing new crontab

[root@dev1 atTest]# crontab -l -u mike
  */1 * * * * echo hello mike > MyFile


[root@dev1 atTest]# cd /home/mike/
[root@dev1 mike]# ls -ltr
  total 4
  -rw-r--r--. 1 mike mike 11 Mar 10 18:50 MyFile

[root@dev1 mike]# cat MyFile
  hello mike


[root@dev1 mike]# crontab -r -u mike
[root@dev1 mike]# crontab -l -u mike
  no crontab for mike

[root@dev1 mike]# ls -l /etc | grep cron
  -rw-r--r--.  1 root root       541 Nov 30 11:39 anacrontab
  drwxr-xr-x.  2 root root        21 Feb 23 21:00 cron.d
  drwxr-xr-x.  2 root root         6 Aug  9  2021 cron.daily
  -rw-r--r--.  1 root root         0 Nov 30 11:39 cron.deny
  drwxr-xr-x.  2 root root        22 Aug  9  2021 cron.hourly
  drwxr-xr-x.  2 root root         6 Aug  9  2021 cron.monthly
  -rw-r--r--.  1 root root       451 Aug  9  2021 crontab
  drwxr-xr-x.  2 root root         6 Aug  9  2021 cron.weekly

















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
