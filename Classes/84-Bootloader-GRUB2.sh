##############################################################################################################
#### Discovery

# GRUB2 is the latest version of GNU GRUB, the GRand Unified Bootloader.
# A bootloader is the first software program that runs when a computer starts. 
# It is responsible for loading and transferring control to the operating system kernel. 

[root@dev1 ~]# cat /etc/default/grub
    GRUB_TIMEOUT=5
    GRUB_DISTRIBUTOR="$(sed 's, release .*$,,g' /etc/system-release)"
    GRUB_DEFAULT=saved
    GRUB_DISABLE_SUBMENU=true
    GRUB_TERMINAL_OUTPUT="console"
    GRUB_CMDLINE_LINUX="crashkernel=1G-4G:192M,4G-64G:256M,64G-:512M resume=/dev/mapper/cs-swap rd.lvm.lv=cs/root rd.lvm.lv=cs/swap rhgb quiet"
    GRUB_DISABLE_RECOVERY="true"
    GRUB_ENABLE_BLSCFG=true

[root@dev1 ~]# vi /etc/default/grub
    GRUB_TIMEOUT=15
    GRUB_DISTRIBUTOR="$(sed 's, release .*$,,g' /etc/system-release)"
    GRUB_DEFAULT=saved
    GRUB_DISABLE_SUBMENU=true
    GRUB_TERMINAL_OUTPUT="console"
    GRUB_CMDLINE_LINUX="crashkernel=1G-4G:192M,4G-64G:256M,64G-:512M resume=/dev/mapper/cs-swap rd.lvm.lv=cs/root rd.lvm.lv=cs/swap rhgb quiet"
    GRUB_DISABLE_RECOVERY="true"
    GRUB_ENABLE_BLSCFG=true

[root@dev1 ~]# grub2-mkconfig -o /boot/grub2/grub.cfg
    Generating grub configuration file ...
    Adding boot menu entry for UEFI Firmware Settings ...
    done

[root@dev1 ~]# reboot

[root@dev1 ~]# Connection to 192.168.0.100 closed by remote host.
    Connection to 192.168.0.100 closed.


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
