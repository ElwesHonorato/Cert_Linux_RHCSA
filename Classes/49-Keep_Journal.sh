
[root@desk journald.conf.d]# mkdir -p /etc/systemd/journald.conf.d

[root@desk journald.conf.d]# vi /etc/systemd/journald.conf.d/storage.conf

  ->> ADD the following:
  [Journal]
  Storage=persistent

[root@desk journald.conf.d]# systemctl restart systemd-journald

[root@desk journald.conf.d]# ls /var/log/journal/
  aa41cb3c2e4641a38cfd003c8b0f5151

[root@desk journald.conf.d]# journalctl --list-boots
  IDX BOOT ID                          FIRST ENTRY                 LAST ENTRY
    0 1f64ce84d32440f0b00d3cccc7a907ef Sun 2024-02-25 14:00:11 -03 Sun 2024-02-25 14:06:04 -03

[root@desk journald.conf.d]# uptime
   14:07:21 up 7 min,  1 user,  load average: 0.00, 0.10, 0.07

[root@desk journald.conf.d]# reboot

[root@desk journald.conf.d]# Connection to 192.168.0.50 closed by remote host.
  Connection to 192.168.0.50 closed.

[root@desk ~]# journalctl --list-boots
  IDX BOOT ID                          FIRST ENTRY                 LAST ENTRY
   -1 1f64ce84d32440f0b00d3cccc7a907ef Sun 2024-02-25 14:00:11 -03 Sun 2024-02-25 14:07:33 -03
    0 04138acb346e441183377e0a4a02e677 Sun 2024-02-25 14:07:44 -03 Sun 2024-02-25 14:09:13 -03

[root@desk ~]# journalctl -b -1 | head
  Feb 25 14:00:11 desk.temweb.local kernel: Linux version 5.14.0-419.el9.x86_64 (mockbuild@x86-05.stream.rdu2.redhat.com) (gcc (GCC) 11.4.1 20231218 (Red Hat 11.4.1-3), GNU ld version 2.35.2-42.el9) #1 SMP PREEMPT_DYNAMIC Wed Feb 7 23:01:41 UTC 2024
  Feb 25 14:00:11 desk.temweb.local kernel: The list of certified hardware and cloud instances for Red Hat Enterprise Linux 9 can be viewed at the Red Hat Ecosystem Catalog, https://catalog.redhat.com.
  Feb 25 14:00:11 desk.temweb.local kernel: Command line: BOOT_IMAGE=(hd0,msdos1)/vmlinuz-5.14.0-419.el9.x86_64 root=/dev/mapper/cs-root ro crashkernel=1G-4G:192M,4G-64G:256M,64G-:512M resume=/dev/mapper/cs-swap rd.lvm.lv=cs/root rd.lvm.lv=cs/swap rhgb quiet
  Feb 25 14:00:11 desk.temweb.local kernel: x86/fpu: x87 FPU will use FXSAVE
  Feb 25 14:00:11 desk.temweb.local kernel: signal: max sigframe size: 1440
  Feb 25 14:00:11 desk.temweb.local kernel: BIOS-provided physical RAM map:
  Feb 25 14:00:11 desk.temweb.local kernel: BIOS-e820: [mem 0x0000000000000000-0x000000000009fbff] usable
  Feb 25 14:00:11 desk.temweb.local kernel: BIOS-e820: [mem 0x000000000009fc00-0x000000000009ffff] reserved
  Feb 25 14:00:11 desk.temweb.local kernel: BIOS-e820: [mem 0x00000000000f0000-0x00000000000fffff] reserved
  Feb 25 14:00:11 desk.temweb.local kernel: BIOS-e820: [mem 0x0000000000100000-0x000000007e7effff] usable
