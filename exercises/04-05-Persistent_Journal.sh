# Cerifique-se que o journal de log é salvo após o reboot
su -

journalctl --list-boots

# mkdir -p, --parents
#         no error if existing, make parent directories as needed
mkdir -p /etc/systemd/journald.conf.d

vi /etc/systemd/journald.conf.d/storage
# Add ->>
# [Journal]
# Storage=persistent

systemctl restart systemd-journald

journalctl --list-boots

reboot

journalctl --list-boots
