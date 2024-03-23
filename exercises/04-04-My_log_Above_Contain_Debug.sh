# Crie um arquivo de log chamado meulog que registra mensagens do syslog acima de debug

man 5 rsyslog.conf


vi /etc/rsyslog.d/another_log.conf
# Add ->>
# *.info /var/log/another_log.log

systemctl restart rsyslog


#  -f, --follow[={name|descriptor}]
#               output appended data as the file grows
tail -f /var/log/another_log.log




