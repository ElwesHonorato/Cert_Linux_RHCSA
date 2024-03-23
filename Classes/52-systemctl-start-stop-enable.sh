
[root@desk ~]# dnf search vsftpd

[root@desk ~]# dnf install -y vsftpd

[root@desk ~]# systemctl is-enabled vsftpd
disabled

[root@desk ~]# systemctl enable vsftpd
Created symlink /etc/systemd/system/multi-user.target.wants/vsftpd.service → /usr/lib/systemd/system/vsftpd.service.

[root@desk ~]# systemctl is-enabled vsftpd
enabled

[root@desk ~]# systemctl status vsftpd
○ vsftpd.service - Vsftpd ftp daemon
     Loaded: loaded (/usr/lib/systemd/system/vsftpd.service; enabled; preset: disabled)
     Active: inactive (dead)

[root@desk ~]# systemctl start vsftpd

[root@desk ~]# systemctl status vsftpd
● vsftpd.service - Vsftpd ftp daemon
     Loaded: loaded (/usr/lib/systemd/system/vsftpd.service; enabled; preset: disabled)
     Active: active (running) since Sun 2024-02-25 15:25:15 -03; 10s ago
    Process: 2702 ExecStart=/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf (code=exited, status=0/SUCCESS)
   Main PID: 2703 (vsftpd)
      Tasks: 1 (limit: 10812)
     Memory: 716.0K
        CPU: 8ms
     CGroup: /system.slice/vsftpd.service
             └─2703 /usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf

Feb 25 15:25:15 desk.temweb.local systemd[1]: Starting Vsftpd ftp daemon...
Feb 25 15:25:15 desk.temweb.local systemd[1]: Started Vsftpd ftp daemon.

[root@desk ~]# systemctl is-enabled vsftpd
disabled

[root@desk ~]# systemctl enable vsftpd
Created symlink /etc/systemd/system/multi-user.target.wants/vsftpd.service → /usr/lib/systemd/system/vsftpd.service.

[root@desk ~]# systemctl is-enabled vsftpd
enabled

[root@desk ~]# systemctl status vsftpd
○ vsftpd.service - Vsftpd ftp daemon
     Loaded: loaded (/usr/lib/systemd/system/vsftpd.service; enabled; preset: disabled)
     Active: inactive (dead)

[root@desk ~]# systemctl start vsftpd

[root@desk ~]# systemctl status vsftpd
● vsftpd.service - Vsftpd ftp daemon
     Loaded: loaded (/usr/lib/systemd/system/vsftpd.service; enabled; preset: disabled)
     Active: active (running) since Sun 2024-02-25 15:25:15 -03; 10s ago
    Process: 2702 ExecStart=/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf (code=exited, status=0/SUCCESS)
   Main PID: 2703 (vsftpd)
      Tasks: 1 (limit: 10812)
     Memory: 716.0K
        CPU: 8ms
     CGroup: /system.slice/vsftpd.service
             └─2703 /usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf

Feb 25 15:25:15 desk.temweb.local systemd[1]: Starting Vsftpd ftp daemon...
Feb 25 15:25:15 desk.temweb.local systemd[1]: Started Vsftpd ftp daemon.

[root@desk ~]# systemctl stop vsftpd

[root@desk ~]# systemctl status vsftpd
○ vsftpd.service - Vsftpd ftp daemon
     Loaded: loaded (/usr/lib/systemd/system/vsftpd.service; enabled; preset: disabled)
     Active: inactive (dead) since Sun 2024-02-25 15:26:22 -03; 9s ago
   Duration: 1min 7.305s
    Process: 2702 ExecStart=/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf (code=exited, status=0/SUCCESS)
   Main PID: 2703 (code=killed, signal=TERM)
        CPU: 8ms

Feb 25 15:25:15 desk.temweb.local systemd[1]: Starting Vsftpd ftp daemon...
Feb 25 15:25:15 desk.temweb.local systemd[1]: Started Vsftpd ftp daemon.
Feb 25 15:26:22 desk.temweb.local systemd[1]: Stopping Vsftpd ftp daemon...
Feb 25 15:26:22 desk.temweb.local systemd[1]: vsftpd.service: Deactivated successfully.
Feb 25 15:26:22 desk.temweb.local systemd[1]: Stopped Vsftpd ftp daemon.

[root@desk ~]# systemctl is-enabled httpd
disabled

[root@desk ~]# systemctl enable httpd
Created symlink /etc/systemd/system/multi-user.target.wants/httpd.service → /usr/lib/systemd/system/httpd.service.

[root@desk ~]# systemctl is-enabled
Too few arguments.

[root@desk ~]# systemctl is-enabled httpd
enabled
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
