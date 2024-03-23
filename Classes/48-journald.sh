
[root@desk ~]# journalctl -u httpd | tail
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

[root@desk ~]# journalctl --disk-usage
  Archived and active journals take up 13.1M in the file system.

[root@desk ~]# journalctl --list-boots
  IDX BOOT ID                          FIRST ENTRY                 LAST ENTRY
    0 11f204a395894b94b9e94565c69db8b6 Sat 2024-02-24 23:20:46 -03 Sun 2024-02-25 13:40:18 -03

[root@desk ~]# journalctl --since=yesterday --until=now | tail
  Feb 25 13:30:21 desk.temweb.local systemd[1]: tuned.service: Deactivated successfully.
  Feb 25 13:30:21 desk.temweb.local systemd[1]: Stopped Dynamic System Tuning Daemon.
  Feb 25 13:30:21 desk.temweb.local systemd[1]: tuned.service: Consumed 1.055s CPU time.
  Feb 25 13:30:21 desk.temweb.local systemd[1]: Starting Dynamic System Tuning Daemon...
  Feb 25 13:30:21 desk.temweb.local systemd[1]: Started Dynamic System Tuning Daemon.
  Feb 25 13:40:18 desk.temweb.local systemd[1]: Starting PackageKit Daemon...
  Feb 25 13:40:18 desk.temweb.local PackageKit[4786]: daemon start
  Feb 25 13:40:18 desk.temweb.local systemd[1]: Started PackageKit Daemon.
  Feb 25 13:40:18 desk.temweb.local dbus-broker[729]: A security policy denied :1.24 to send method call /org/freedesktop/PackageKit:org.freedesktop.DBus.Properties.GetAll to :1.105.
  Feb 25 13:40:18 desk.temweb.local PackageKit[4786]: search-file transaction /48_dbdcaeaa from uid 0 finished with success after 477ms

[root@desk ~]# journalctl --help
