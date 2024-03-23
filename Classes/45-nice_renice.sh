[root@desk ~]# nice -n 5 dd if=/dev/zero of=/dev/null &

[root@desk ~]# jobs
    [1]+  Running                 nice -n 5 dd if=/dev/zero of=/dev/null &

[root@desk ~]# ps aux | grep dd
    root           2  0.0  0.0      0     0 ?        S    Feb24   0:00 [kthreadd]
    root          58  0.0  0.0      0     0 ?        I<   Feb24   0:00 [ipv6_addrconf]
    gdm         1040  0.0  0.4  16204  7552 tty1     S+   Feb24   0:00 dbus-daemon --nofork --print-address 4 --session
    gdm         1350  0.0  0.3  15756  7040 tty1     S+   Feb24   0:00 /usr/bin/dbus-daemon --config-file=/usr/share/defaults/at-spi2/accessibility.conf --nofork --print-address 3
    root        3396 99.5  0.0 220988  1792 pts/0    RN   13:01   8:28 dd if=/dev/zero of=/dev/null
    root        3439  0.0  0.1 221796  2432 pts/0    S+   13:09   0:00 grep --color=auto dd
    q 

[root@desk ~]# top
    top - 13:09:51 up 13:49,  1 user,  load average: 1.07, 0.88, 0.46
    Tasks: 175 total,   2 running, 173 sleeping,   0 stopped,   0 zombie
    %Cpu(s):  0.0 us, 63.3 sy, 36.7 ni,  0.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
    MiB Mem :   1751.7 total,    567.3 free,    704.9 used,    654.3 buff/cache
    MiB Swap:    956.0 total,    956.0 free,      0.0 used.   1046.8 avail Mem

        PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
       3396 root      25   5  220988   1792   1792 R  99.7   0.1   8:48.32 dd
       3389 root      20   0       0      0      0 I   0.3   0.0   0:00.29 kworker/0:2-ata_sff
          1 root      20   0  116132  16932  10956 S   0.0   0.9   0:02.90 systemd
          2 root      20   0       0      0      0 S   0.0   0.0   0:00.00 kthreadd
          3 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 rcu_gp
          4 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 rcu_par_gp
          5 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 slub_flushwq


[root@desk ~]# renice -n 10 3396
    3396 (process ID) old priority 5, new priority 10


[root@desk ~]# top
    top - 13:11:07 up 13:50,  1 user,  load average: 1.02, 0.91, 0.51
    Tasks: 175 total,   2 running, 173 sleeping,   0 stopped,   0 zombie
    %Cpu(s):  0.0 us, 61.3 sy, 38.7 ni,  0.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
    MiB Mem :   1751.7 total,    567.3 free,    704.9 used,    654.3 buff/cache
    MiB Swap:    956.0 total,    956.0 free,      0.0 used.   1046.8 avail Mem

        PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
       3396 root      30  10  220988   1792   1792 R  99.7   0.1  10:03.96 dd
       3442 root      20   0  226000   4224   3456 R   0.3   0.2   0:00.01 top
          1 root      20   0  116132  16932  10956 S   0.0   0.9   0:02.90 systemd
          2 root      20   0       0      0      0 S   0.0   0.0   0:00.00 kthreadd
          3 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 rcu_gp
          4 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 rcu_par_gp
          5 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 slub_flushwq
          6 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 netns


[root@desk ~]# renice -n 5 3396
    3396 (process ID) old priority 10, new priority 5