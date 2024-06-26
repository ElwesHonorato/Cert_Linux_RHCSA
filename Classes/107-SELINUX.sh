##############################################################################################################
#### Discovery

[root@dev1 ~]# hostname
    dev1.temweb.local
[root@dev1 ~]# cat /etc/selinux/config
    # This file controls the state of SELinux on the system.
    # SELINUX= can take one of these three values:
    #     enforcing - SELinux security policy is enforced.
    #     permissive - SELinux prints warnings instead of enforcing.
    #     disabled - No SELinux policy is loaded.
    # See also:
    # https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/9/html/using_selinux/changing-selinux-states-and-modes_using-selinux#changing-selinux-modes-at-boot-time_changing-selinux-states-and-modes
    #
    # NOTE: Up to RHEL 8 release included, SELINUX=disabled would also
    # fully disable SELinux during boot. If you need a system with SELinux
    # fully disabled instead of SELinux running with no policy loaded, you
    # need to pass selinux=0 to the kernel command line. You can use grubby
    # to persistently set the bootloader to boot with selinux=0:
    #
    #    grubby --update-kernel ALL --args selinux=0
    #
    # To revert back to SELinux enabled:
    #
    #    grubby --update-kernel ALL --remove-args selinux
    #
    SELINUX=enforcing
    # SELINUXTYPE= can take one of these three values:
    #     targeted - Targeted processes are protected,
    #     minimum - Modification of targeted policy. Only selected processes are protected.
    #     mls - Multi Level Security protection.
    SELINUXTYPE=targeted

[root@dev1 ~]# vi /etc/selinux/config
    # This file controls the state of SELinux on the system.
    # SELINUX= can take one of these three values:
    #     enforcing - SELinux security policy is enforced.
    #     permissive - SELinux prints warnings instead of enforcing.
    #     disabled - No SELinux policy is loaded.
    # See also:
    # https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/9/html/using_selinux/changing-selinux-states-and-modes_using-selinux#changing-selinux-modes-at-boot-time_changing-selinux-states-and-modes
    #
    # NOTE: Up to RHEL 8 release included, SELINUX=disabled would also
    # fully disable SELinux during boot. If you need a system with SELinux
    # fully disabled instead of SELinux running with no policy loaded, you
    # need to pass selinux=0 to the kernel command line. You can use grubby
    # to persistently set the bootloader to boot with selinux=0:
    #
    #    grubby --update-kernel ALL --args selinux=0
    #
    # To revert back to SELinux enabled:
    #
    #    grubby --update-kernel ALL --remove-args selinux
    #
    # SELINUX=enforcing
    SELINUX=disabled
    # SELINUXTYPE= can take one of these three values:
    #     targeted - Targeted processes are protected,
    #     minimum - Modification of targeted policy. Only selected processes are protected.
    #     mls - Multi Level Security protection.
    SELINUXTYPE=targeted

[root@dev1 ~]# reboot

[root@dev1 ~]# getenforce
    Disabled
[root@dev1 ~]# setenforce
    usage:  setenforce [ Enforcing | Permissive | 1 | 0 ]
[root@dev1 ~]# setenforce 1
    setenforce: SELinux is disabled
[root@dev1 ~]# vi /etc/selinux/config
    # This file controls the state of SELinux on the system.
    # SELINUX= can take one of these three values:
    #     enforcing - SELinux security policy is enforced.
    #     permissive - SELinux prints warnings instead of enforcing.
    #     disabled - No SELinux policy is loaded.
    # See also:
    # https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/9/html/using_selinux/changing-selinux-states-and-modes_using-selinux#changing-selinux-modes-at-boot-time_changing-selinux-states-and-modes
    #
    # NOTE: Up to RHEL 8 release included, SELINUX=disabled would also
    # fully disable SELinux during boot. If you need a system with SELinux
    # fully disabled instead of SELinux running with no policy loaded, you
    # need to pass selinux=0 to the kernel command line. You can use grubby
    # to persistently set the bootloader to boot with selinux=0:
    #
    #    grubby --update-kernel ALL --args selinux=0
    #
    # To revert back to SELinux enabled:
    #
    #    grubby --update-kernel ALL --remove-args selinux
    #
    SELINUX=enforcing
    # SELINUXTYPE= can take one of these three values:
    #     targeted - Targeted processes are protected,
    #     minimum - Modification of targeted policy. Only selected processes are protected.
    #     mls - Multi Level Security protection.
    SELINUXTYPE=targeted
[root@dev1 ~]# reboot
[root@dev1 ~]# getenforce
    Enforcing
[root@dev1 ~]# setenforce 0
[root@dev1 ~]# getenforce
    Permissive
[root@dev1 ~]# setenforce 1
[root@dev1 ~]# getenforce
    Enforcing







# /-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-
# /-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-






































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
