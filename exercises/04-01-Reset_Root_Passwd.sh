# - Stop initilization by pressing e

# - Go to the Linux line

# - Add rd.break to the end of the line

# - Press Ctrl + x

mount -o remount,rw /sysroot

chroot /sysroot/

passwd

touch /.autorelabel

exit

exit