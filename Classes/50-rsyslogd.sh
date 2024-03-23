
[root@desk ~]# man 5 rsyslog.conf

#  The priority is one of the following keywords, in  ascending  order:  debug,  info,  notice,
#        warning,  warn  (same as warning), err, error (same as err), crit, alert, emerg, panic (same
#        as emerg). The keywords error, warn and panic are deprecated and should not be used anymore.
#        The priority defines the severity of the message.
#  The  behavior of the original BSD syslogd is that all messages of the specified priority and
#        higher are logged according to the given action. Rsyslogd behaves the same, but has some ex‐
#        tensions

[root@desk ~]# cat /etc/rsyslog.conf

[root@desk ~]# ls -d /etc/rsyslog.d/
    /etc/rsyslog.d/

[root@desk ~]# vi /etc/rsyslog.d/mensagens-debug.conf
    ->> Add the following:
    *.debug /var/log/mensagens-debug.log

[root@srv0 ~]# systemctl restart rsyslog

[root@desk ~]# tail -f /var/log/mensagens-debug.log
    Feb 25 14:27:45 desk systemd[1]: Stopping System Logging Service...
    Feb 25 14:27:46 desk rsyslogd[999]: [origin software="rsyslogd" swVersion="8.2310.0-3.el9" x-pid="999" x-info="https://www.rsyslog.com"] exiting on signal 15.
    Feb 25 14:27:46 desk systemd[1]: rsyslog.service: Deactivated successfully.
    Feb 25 14:27:46 desk systemd[1]: Stopped System Logging Service.
    Feb 25 14:27:46 desk systemd[1]: Starting System Logging Service...
    Feb 25 14:27:46 desk systemd[1]: Started System Logging Service.
    Feb 25 14:27:46 desk rsyslogd[1989]: [origin software="rsyslogd" swVersion="8.2310.0-3.el9" x-pid="1989" x-info="https://www.rsyslog.com"] start
    Feb 25 14:27:46 desk rsyslogd[1989]: imjournal: journal files changed, reloading...  [v8.2310.0-3.el9 try https://www.rsyslog.com/e/0 ]

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
