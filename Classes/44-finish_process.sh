[root@desk ~]# systemctl start httpd

[root@desk ~]# pgrep httpd
   2394
   2395
   2396
   2397
   2398

[root@desk ~]# ps aux | grep httpd
   root        2394  0.1  0.6  20348 11620 ?        Ss   10:41   0:00 /usr/sbin/httpd -DFOREGROUND
   apache      2395  0.0  0.4  22084  7504 ?        S    10:41   0:00 /usr/sbin/httpd -DFOREGROUND
   apache      2396  0.0  0.7 1079896 13548 ?       Sl   10:41   0:00 /usr/sbin/httpd -DFOREGROUND
   apache      2397  0.0  0.6 1079896 11424 ?       Sl   10:41   0:00 /usr/sbin/httpd -DFOREGROUND
   apache      2398  0.0  0.7 1211032 13804 ?       Sl   10:41   0:00 /usr/sbin/httpd -DFOREGROUND
   root        2614  0.0  0.1 221796  2432 pts/0    S+   10:43   0:00 grep --color=auto httpd

[root@desk ~]# kill -9 2394

[root@desk ~]# systemctl status httpd
   × httpd.service - The Apache HTTP Server
        Loaded: loaded (/usr/lib/systemd/system/httpd.service; disabled; preset: disabled)
        Active: failed (Result: signal) since Sun 2024-02-25 10:46:40 -03; 10s ago
      Duration: 5min 7.272s
          Docs: man:httpd.service(8)
       Process: 2394 ExecStart=/usr/sbin/httpd $OPTIONS -DFOREGROUND (code=killed, signal=KILL)
      Main PID: 2394 (code=killed, signal=KILL)
        Status: "Total requests: 0; Idle/Busy workers 100/0;Requests/sec: 0; Bytes served/sec:   0 B/sec"
           CPU: 672ms

   Feb 25 10:46:40 desk.temweb.local systemd[1]: httpd.service: Killing process 2601 (n/a) with signal S>
   Feb 25 10:46:40 desk.temweb.local systemd[1]: httpd.service: Killing process 2602 (n/a) with signal S>
   Feb 25 10:46:40 desk.temweb.local systemd[1]: httpd.service: Killing process 2603 (n/a) with signal S>
   Feb 25 10:46:40 desk.temweb.local systemd[1]: httpd.service: Killing process 2604 (n/a) with signal S>
   Feb 25 10:46:40 desk.temweb.local systemd[1]: httpd.service: Killing process 2605 (n/a) with signal S>
   Feb 25 10:46:40 desk.temweb.local systemd[1]: httpd.service: Killing process 2606 (n/a) with signal S>
   Feb 25 10:46:40 desk.temweb.local systemd[1]: httpd.service: Killing process 2607 (n/a) with signal S>
   Feb 25 10:46:40 desk.temweb.local systemd[1]: httpd.service: Killing process 2608 (n/a) with signal S>
   Feb 25 10:46:40 desk.temweb.local systemd[1]: httpd.service: Killing process 2609 (n/a) with signal S>
   Feb 25 10:46:40 desk.temweb.local systemd[1]: httpd.service: Failed with result 'signal'.
   lines 1-20/20 (END)

   ##################################################################################################################################
   ##################################################################################################################################
   ##################################################################################################################################

[root@desk ~]# systemctl start httpd

[root@desk ~]# systemctl status httpd
   ● httpd.service - The Apache HTTP Server
        Loaded: loaded (/usr/lib/systemd/system/httpd.service; disabled; preset: disabled)
        Active: active (running) since Sun 2024-02-25 10:48:30 -03; 8s ago
          Docs: man:httpd.service(8)
      Main PID: 2631 (httpd)
        Status: "Started, listening on: port 80"
         Tasks: 213 (limit: 10812)
        Memory: 23.0M
           CPU: 63ms
        CGroup: /system.slice/httpd.service
                ├─2631 /usr/sbin/httpd -DFOREGROUND
                ├─2632 /usr/sbin/httpd -DFOREGROUND
                ├─2633 /usr/sbin/httpd -DFOREGROUND
                ├─2634 /usr/sbin/httpd -DFOREGROUND
                └─2635 /usr/sbin/httpd -DFOREGROUND

   Feb 25 10:48:30 desk.temweb.local systemd[1]: Starting The Apache HTTP Server...
   Feb 25 10:48:30 desk.temweb.local systemd[1]: Started The Apache HTTP Server.
   Feb 25 10:48:30 desk.temweb.local httpd[2631]: Server configured, listening on: port 80

[root@desk ~]# ps aux | grep httpd
   root        2631  0.0  0.6  20348 11512 ?        Ss   10:48   0:00 /usr/sbin/httpd -DFOREGROUND
   apache      2632  0.0  0.4  22084  7632 ?        S    10:48   0:00 /usr/sbin/httpd -DFOREGROUND
   apache      2633  0.0  0.6 1079896 11408 ?       Sl   10:48   0:00 /usr/sbin/httpd -DFOREGROUND
   apache      2634  0.0  0.6 1079896 11408 ?       Sl   10:48   0:00 /usr/sbin/httpd -DFOREGROUND
   apache      2635  0.0  0.7 1211032 13668 ?       Sl   10:48   0:00 /usr/sbin/httpd -DFOREGROUND
   root        2851  0.0  0.1 221664  2432 pts/0    R+   10:49   0:00 grep --color=auto httpd

[root@desk ~]# kill -15 2631

[root@desk ~]# systemctl status httpd
   ○ httpd.service - The Apache HTTP Server
        Loaded: loaded (/usr/lib/systemd/system/httpd.service; disabled; preset: disabled)
        Active: inactive (dead)
          Docs: man:httpd.service(8)

   Feb 25 10:46:40 desk.temweb.local systemd[1]: httpd.service: Killing process 2605 (n/a) with signal S>
   Feb 25 10:46:40 desk.temweb.local systemd[1]: httpd.service: Killing process 2606 (n/a) with signal S>
   Feb 25 10:46:40 desk.temweb.local systemd[1]: httpd.service: Killing process 2607 (n/a) with signal S>
   Feb 25 10:46:40 desk.temweb.local systemd[1]: httpd.service: Killing process 2608 (n/a) with signal S>
   Feb 25 10:46:40 desk.temweb.local systemd[1]: httpd.service: Killing process 2609 (n/a) with signal S>
   Feb 25 10:46:40 desk.temweb.local systemd[1]: httpd.service: Failed with result 'signal'.
   Feb 25 10:48:30 desk.temweb.local systemd[1]: Starting The Apache HTTP Server...
   Feb 25 10:48:30 desk.temweb.local systemd[1]: Started The Apache HTTP Server.
   Feb 25 10:48:30 desk.temweb.local httpd[2631]: Server configured, listening on: port 80
   Feb 25 10:52:27 desk.temweb.local systemd[1]: httpd.service: Deactivated successfully.
   lines 1-15/15 (END)



   ##################################################################################################################################
   ##################################################################################################################################
   ##################################################################################################################################

[root@desk ~]# systemctl start httpd

[root@desk ~]# systemctl status httpd
   ● httpd.service - The Apache HTTP Server
        Loaded: loaded (/usr/lib/systemd/system/httpd.service; disabled; preset: disabled)
        Active: active (running) since Sun 2024-02-25 11:52:43 -03; 5s ago
          Docs: man:httpd.service(8)
      Main PID: 2889 (httpd)
        Status: "Started, listening on: port 80"
         Tasks: 213 (limit: 10812)
        Memory: 28.9M
           CPU: 113ms
        CGroup: /system.slice/httpd.service
                ├─2889 /usr/sbin/httpd -DFOREGROUND
                ├─2890 /usr/sbin/httpd -DFOREGROUND
                ├─2891 /usr/sbin/httpd -DFOREGROUND
                ├─2892 /usr/sbin/httpd -DFOREGROUND
                └─2893 /usr/sbin/httpd -DFOREGROUND

   Feb 25 11:52:43 desk.temweb.local systemd[1]: Starting The Apache HTTP Server...
   Feb 25 11:52:43 desk.temweb.local systemd[1]: Started The Apache HTTP Server.
   Feb 25 11:52:43 desk.temweb.local httpd[2889]: Server configured, listening on: port 80

[root@desk ~]# pidof httpd
   2893 2892 2891 2890 2889

[root@desk ~]# pkill httpd

[root@desk ~]# systemctl status httpd
   ○ httpd.service - The Apache HTTP Server
        Loaded: loaded (/usr/lib/systemd/system/httpd.service; disabled; preset: disabled)
        Active: inactive (dead)
          Docs: man:httpd.service(8)

   Feb 25 10:46:40 desk.temweb.local systemd[1]: httpd.service: Killing process 2609 (n/a) with signal S>
   Feb 25 10:46:40 desk.temweb.local systemd[1]: httpd.service: Failed with result 'signal'.
   Feb 25 10:48:30 desk.temweb.local systemd[1]: Starting The Apache HTTP Server...
   Feb 25 10:48:30 desk.temweb.local systemd[1]: Started The Apache HTTP Server.
   Feb 25 10:48:30 desk.temweb.local httpd[2631]: Server configured, listening on: port 80
   Feb 25 10:52:27 desk.temweb.local systemd[1]: httpd.service: Deactivated successfully.
   Feb 25 11:52:43 desk.temweb.local systemd[1]: Starting The Apache HTTP Server...
   Feb 25 11:52:43 desk.temweb.local systemd[1]: Started The Apache HTTP Server.
   Feb 25 11:52:43 desk.temweb.local httpd[2889]: Server configured, listening on: port 80
   Feb 25 11:53:25 desk.temweb.local systemd[1]: httpd.service: Deactivated successfully.
   lines 1-15/15 (END)

   ##################################################################################################################################
   ##################################################################################################################################
   ##################################################################################################################################
[root@desk ~]# systemctl start httpd

[root@desk ~]# systemctl status httpd
   ● httpd.service - The Apache HTTP Server
        Loaded: loaded (/usr/lib/systemd/system/httpd.service; disabled; preset: disabled)
        Active: active (running) since Sun 2024-02-25 11:55:06 -03; 10s ago
          Docs: man:httpd.service(8)
      Main PID: 3132 (httpd)
        Status: "Total requests: 0; Idle/Busy workers 100/0;Requests/sec: 0; Bytes served/sec:   0 B/sec"
         Tasks: 213 (limit: 10812)
        Memory: 34.9M
           CPU: 98ms
        CGroup: /system.slice/httpd.service
                ├─3132 /usr/sbin/httpd -DFOREGROUND
                ├─3133 /usr/sbin/httpd -DFOREGROUND
                ├─3134 /usr/sbin/httpd -DFOREGROUND
                ├─3135 /usr/sbin/httpd -DFOREGROUND
                └─3136 /usr/sbin/httpd -DFOREGROUND

   Feb 25 11:55:06 desk.temweb.local systemd[1]: Starting The Apache HTTP Server...
   Feb 25 11:55:06 desk.temweb.local systemd[1]: Started The Apache HTTP Server.
   Feb 25 11:55:06 desk.temweb.local httpd[3132]: Server configured, listening on: port 80

[root@desk ~]# killall httpd

[root@desk ~]# systemctl status httpd
   ○ httpd.service - The Apache HTTP Server
        Loaded: loaded (/usr/lib/systemd/system/httpd.service; disabled; preset: disabled)
        Active: inactive (dead)
          Docs: man:httpd.service(8)

   Feb 25 10:48:30 desk.temweb.local httpd[2631]: Server configured, listening on: port 80
   Feb 25 10:52:27 desk.temweb.local systemd[1]: httpd.service: Deactivated successfully.
   Feb 25 11:52:43 desk.temweb.local systemd[1]: Starting The Apache HTTP Server...
   Feb 25 11:52:43 desk.temweb.local systemd[1]: Started The Apache HTTP Server.
   Feb 25 11:52:43 desk.temweb.local httpd[2889]: Server configured, listening on: port 80
   Feb 25 11:53:25 desk.temweb.local systemd[1]: httpd.service: Deactivated successfully.
   Feb 25 11:55:06 desk.temweb.local systemd[1]: Starting The Apache HTTP Server...
   Feb 25 11:55:06 desk.temweb.local systemd[1]: Started The Apache HTTP Server.
   Feb 25 11:55:06 desk.temweb.local httpd[3132]: Server configured, listening on: port 80
   Feb 25 11:55:28 desk.temweb.local systemd[1]: httpd.service: Deactivated successfully.


   ##################################################################################################################################
   ##################################################################################################################################
   ##################################################################################################################################

[root@desk ~]# dd if=/dev/zero of=/dev/null &
   [1] 3371
[root@desk ~]# jobs
   [1]+  Running                 dd if=/dev/zero of=/dev/null &
[root@desk ~]# top
   top - 11:59:42 up 12:38,  1 user,  load average: 0.44, 0.20, 0.08
   Tasks: 173 total,   4 running, 169 sleeping,   0 stopped,   0 zombie
   %Cpu(s): 36.7 us, 63.3 sy,  0.0 ni,  0.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
   MiB Mem :   1751.7 total,    489.6 free,    782.8 used,    649.7 buff/cache
   MiB Swap:    956.0 total,    956.0 free,      0.0 used.    969.0 avail Mem

       PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
      3371 root      20   0  220988   1792   1792 R  99.7   0.1   0:09.85 dd
         1 root      20   0  107936  16932  10956 S   0.0   0.9   0:02.82 systemd
         2 root      20   0       0      0      0 S   0.0   0.0   0:00.00 kthreadd
         3 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 rcu_gp



   ->> As it is the first command, press K
   top - 12:00:18 up 12:39,  1 user,  load average: 0.69, 0.29, 0.11
   Tasks: 173 total,   2 running, 171 sleeping,   0 stopped,   0 zombie
   %Cpu(s): 31.2 us, 65.6 sy,  0.0 ni,  0.0 id,  0.0 wa,  0.0 hi,  3.1 si,  0.0 st
   MiB Mem :   1751.7 total,    489.6 free,    782.8 used,    649.7 buff/cache
   MiB Swap:    956.0 total,    956.0 free,      0.0 used.    969.0 avail Mem
   PID to signal/kill [default pid = 3371] ####### <- <- <- You'll be prompted with this #######
       PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
      3371 root      20   0  220988   1792   1792 R  99.7   0.1   0:45.91 dd
         1 root      20   0  107936  16932  10956 S   0.0   0.9   0:02.82 systemd
         2 root      20   0       0      0      0 S   0.0   0.0   0:00.00 kthreadd
         3 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 rcu_gp

   ->> To confirm, press Enter
   top - 12:00:18 up 12:39,  1 user,  load average: 0.69, 0.29, 0.11
   Tasks: 173 total,   2 running, 171 sleeping,   0 stopped,   0 zombie
   %Cpu(s): 31.2 us, 65.6 sy,  0.0 ni,  0.0 id,  0.0 wa,  0.0 hi,  3.1 si,  0.0 st
   MiB Mem :   1751.7 total,    489.6 free,    782.8 used,    649.7 buff/cache
   MiB Swap:    956.0 total,    956.0 free,      0.0 used.    969.0 avail Mem
   Send pid 3371 signal [15/sigterm] ####### <- <- <- You'll be prompted with this #######
       PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
      3371 root      20   0  220988   1792   1792 R  99.7   0.1   0:45.91 dd
         1 root      20   0  107936  16932  10956 S   0.0   0.9   0:02.82 systemd
         2 root      20   0       0      0      0 S   0.0   0.0   0:00.00 kthreadd
         3 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 rcu_gp

   ->> To confirm, press Enter again
   top - 12:00:18 up 12:39,  1 user,  load average: 0.69, 0.29, 0.11
   Tasks: 173 total,   2 running, 171 sleeping,   0 stopped,   0 zombie
   %Cpu(s): 31.2 us, 65.6 sy,  0.0 ni,  0.0 id,  0.0 wa,  0.0 hi,  3.1 si,  0.0 st
   MiB Mem :   1751.7 total,    489.6 free,    782.8 used,    649.7 buff/cache
   MiB Swap:    956.0 total,    956.0 free,      0.0 used.    969.0 avail Mem
   Send pid 3371 signal [15/sigterm]
       PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
      3371 root      20   0  220988   1792   1792 R  99.7   0.1   0:45.91 dd
         1 root      20   0  107936  16932  10956 S   0.0   0.9   0:02.82 systemd
         2 root      20   0       0      0      0 S   0.0   0.0   0:00.00 kthreadd
         3 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 rcu_gp

   ->> To confirm, press Enter again
   top - 12:04:39 up 12:43,  1 user,  load average: 0.92, 0.71, 0.34
   Tasks: 171 total,   1 running, 170 sleeping,   0 stopped,   0 zombie
   %Cpu(s):  0.0 us,  0.3 sy,  0.0 ni, 99.7 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
   MiB Mem :   1751.7 total,    568.0 free,    704.4 used,    649.7 buff/cache
   MiB Swap:    956.0 total,    956.0 free,      0.0 used.   1047.3 avail Mem

       PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
      2291 elwes     20   0   19616   7220   5376 S   0.3   0.4   0:00.81 sshd
         1 root      20   0  107936  16932  10956 S   0.0   0.9   0:02.82 systemd
         2 root      20   0       0      0      0 S   0.0   0.0   0:00.00 kthreadd
         3 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 rcu_gp
         4 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 rcu_par_gp

[root@desk ~]# jobs