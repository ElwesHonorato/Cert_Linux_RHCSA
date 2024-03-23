Na srv0, Crie um serviço da firewall customizado que abre a porta 80 e 8080. Chame o serviço de “proxy_reversa”

[root@srv0 ~]# cd /usr/lib/firewalld/services
[root@srv0 services]# pwd
    /usr/lib/firewalld/services

[root@srv0 services]# ls -l | grep http
    -rw-r--r--. 1 root root 336 Nov  6 16:55 http3.xml
    -rw-r--r--. 1 root root 448 Nov  6 16:55 https.xml
    -rw-r--r--. 1 root root 353 Nov  6 16:55 http.xml
    -rw-r--r--. 1 root root 310 Nov  6 16:55 wbem-https.xml
    -rw-r--r--. 1 root root 352 Nov  6 16:55 wbem-http.xml

[root@srv0 services]# cd /etc/firewalld/services

[root@srv0 services]# pwd
    /etc/firewalld/services

[root@srv0 services]# cp /usr/lib/firewalld/services/http.xml /etc/firewalld/services

[root@srv0 services]# mv http.xml proxy_reversa.xml

[root@srv0 services]# cat proxy_reversa.xml
    <?xml version="1.0" encoding="utf-8"?>
    <service>
      <short>WWW (HTTP)</short>
      <description>HTTP is the protocol used to serve Web pages. If you plan to make your Web server publicly available, enable this option. This option is not required for viewing pages locally or developing Web pages.</description>
      <port protocol="tcp" port="80"/>
    </service>

[root@srv0 services]# vi proxy_reversa.xml
    <?xml version="1.0" encoding="utf-8"?>
        <service>
          <short>WWW (HTTP)</short>
          <description>HTTP is the protocol used to serve Web pages. If you plan to make your Web server publicly available, enable this option. This option is not required for viewing pages locally or developing Web pages.</description>
          <port protocol="tcp" port="80"/>
          <port protocol="tcp" port="8080"/>
        </service>
