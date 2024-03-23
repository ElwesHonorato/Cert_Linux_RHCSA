[root@desk ~]# dnf install -y tuned
  Last metadata expiration check: 3:32:25 ago on Sun 25 Feb 2024 09:44:29 AM -03.
  Package tuned-2.21.0-1.el9.noarch is already installed.
  Dependencies resolved.
  Nothing to do.
  Complete!

[root@desk ~]# tuned-adm --help
  usage: tuned-adm [-h] [--version] [--debug] [--async] [--timeout TIMEOUT] [--loglevel LOGLEVEL]
                   {list,active,off,profile,profile_info,recommend,verify,auto_profile,profile_mode}
                   ...

  Manage tuned daemon.

  positional arguments:
    {list,active,off,profile,profile_info,recommend,verify,auto_profile,profile_mode}
      list                list available profiles or plugins (by default profiles)
      active              show active profile
      off                 switch off all tunings
      profile             switch to a given profile, or list available profiles if no profile is given
      profile_info        show information/description of given profile or current profile if no
                          profile is specified
      recommend           recommend profile
      verify              verify profile
      auto_profile        enable automatic profile selection mode, switch to the recommended profile
      profile_mode        show current profile selection mode

  optional arguments:
    -h, --help            show this help message and exit'
    --version, -v         show program's version number and exit
    --debug, -d           show debug messages
    --async, -a           with dbus do not wait on commands completion and return immediately
    --timeout TIMEOUT, -t TIMEOUT
                          with sync operation use specific timeout instead of the default 600
                          second(s)
    --loglevel LOGLEVEL, -l LOGLEVEL
                          level of log messages to capture (one of debug, info, warn, error, console,
                          none). Default: console


[root@desk ~]# tuned-adm active

  Cannot talk to TuneD daemon via DBus. Is TuneD daemon running?
  It seems that tuned daemon is not running, preset profile is not activated.
  Preset profile: virtual-guest

[root@desk ~]# systemctl start tuned

[root@desk ~]# systemctl status tuned
  ● tuned.service - Dynamic System Tuning Daemon
       Loaded: loaded (/usr/lib/systemd/system/tuned.service; enabled; preset: enabled)
       Active: active (running) since Sun 2024-02-25 13:19:54 -03; 6s ago
         Docs: man:tuned(8)
               man:tuned.conf(5)
               man:tuned-adm(8)
     Main PID: 3480 (tuned)
        Tasks: 4 (limit: 10812)
       Memory: 13.7M
          CPU: 487ms
       CGroup: /system.slice/tuned.service
               └─3480 /usr/bin/python3 -Es /usr/sbin/tuned -l -P

  Feb 25 13:19:53 desk.temweb.local systemd[1]: Starting Dynamic System Tuning Daemon...
  Feb 25 13:19:54 desk.temweb.local systemd[1]: Started Dynamic System Tuning Daemon.

[root@desk ~]# tuned-adm active
  Current active profile: virtual-guest

[root@desk ~]# man 8 tuned

[root@desk ~]# man 5 tuned.conf

[root@desk ~]# man 7 tuned-profiles

[root@desk ~]# tuned-adm recommend
  virtual-guest


##################################################################################################################################
##################################################################################################################################
##################################################################################################################################
[root@desk ~]# vi /etc/tuned/tuned-main.conf

  ->> Update as below
  # Dynamicaly tune devices, if disabled only static tuning will be used.
  #dynamic_tuning = 0
  dynamic_tuning = 1

  ->> Save and Exit

[root@desk ~]# systemctl restart tuned

[root@desk ~]# tail -f /var/log/tuned/tuned.log
  2024-02-25 13:30:21,633 INFO     tuned.profiles.loader: loading profile: virtual-guest'
  2024-02-25 13:30:21,637 INFO     tuned.daemon.controller: starting controller
  2024-02-25 13:30:21,637 INFO     tuned.daemon.daemon: starting tuning
  2024-02-25 13:30:21,640 INFO     tuned.plugins.base: instance cpu: assigning devices cpu0
  2024-02-25 13:30:21,641 INFO     tuned.plugins.plugin_cpu: We are running on an x86 GenuineIntel platform
  2024-02-25 13:30:21,645 WARNING  tuned.plugins.plugin_cpu: your CPU doesn't support MSR_IA32_ENERGY_PERF_BIAS, ignoring CPU energy performance bias
  2024-02-25 13:30:21,670 INFO     tuned.plugins.base: instance disk: assigning devices sdb, sda, dm-0, dm-1, sdd, sdc
  2024-02-25 13:30:21,672 INFO     tuned.plugins.plugin_cpu: setting new cpu latency 1000
  2024-02-25 13:30:21,696 INFO     tuned.plugins.plugin_sysctl: reapplying system sysctl
  2024-02-25 13:30:21,696 INFO     tuned.daemon.daemon: static tuning from profile 'virtual-guest' applied


##################################################################################################################################
##################################################################################################################################
##################################################################################################################################

[root@desk ~]# tuned-adm list
  Available profiles:
  - accelerator-performance     - Throughput performance based tuning with disabled higher latency STOP states
  - aws                         - Optimize for aws ec2 instances
  - balanced                    - General non-specialized tuned profile
  - desktop                     - Optimize for the desktop use-case
  - hpc-compute                 - Optimize for HPC compute workloads
  - intel-sst                   - Configure for Intel Speed Select Base Frequency
  - latency-performance         - Optimize for deterministic performance at the cost of increased power consumption
  - network-latency             - Optimize for deterministic performance at the cost of increased power consumption, focused on low latency network performance
  - network-throughput          - Optimize for streaming network throughput, generally only necessary on older CPUs or 40G+ networks
  - optimize-serial-console     - Optimize for serial console use.
  - powersave                   - Optimize for low power consumption
  - throughput-performance      - Broadly applicable tuning that provides excellent performance across a variety of common server workloads
  - virtual-guest               - Optimize for running inside a virtual guest
  - virtual-host                - Optimize for running KVM guests
  Current active profile: virtual-guest

[root@desk ~]# tuned-adm active
  Current active profile: virtual-guest

[root@desk ~]# tuned-adm recommend
  virtual-guest

[root@desk ~]# tuned-adm profile desktop

[root@desk ~]# tuned-adm active
  Current active profile: desktop

[root@desk ~]# tuned-adm recommend
  virtual-guest

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
