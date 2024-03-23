##############################################################################################################
#### Discovery

# /-/-/-/-/-/-/-/-/-/-/-/ ------------- srv0 ------------- /-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/
[root@srv0 ~]# firewall-cmd --get-services
    RH-Satellite-6 RH-Satellite-6-capsule afp amanda-client amanda-k5-client amqp amqps apcupsd audit ausweisapp2 bacula bacula-client bareos-director bareos-filedaemon bareos-storage bb bgp bitcoin bitcoin-rpc bitcoin-testnet bitcoin-testnet-rpc bittorrent-lsd ceph ceph-exporter ceph-mon cfengine checkmk-agent cockpit collectd condor-collector cratedb ctdb dds dds-multicast dds-unicast dhcp dhcpv6 dhcpv6-client distcc dns dns-over-tls docker-registry docker-swarm dropbox-lansync elasticsearch etcd-client etcd-server finger foreman foreman-proxy freeipa-4 freeipa-ldap freeipa-ldaps freeipa-replication freeipa-trust ftp galera ganglia-client ganglia-master git gpsd grafana gre high-availability http http3 https ident imap imaps ipfs ipp ipp-client ipsec irc ircs iscsi-target isns jenkins kadmin kdeconnect kerberos kibana klogin kpasswd kprop kshell kube-api kube-apiserver kube-control-plane kube-control-plane-secure kube-controller-manager kube-controller-manager-secure kube-nodeport-services kube-scheduler kube-scheduler-secure kube-worker kubelet kubelet-readonly kubelet-worker ldap ldaps libvirt libvirt-tls lightning-network llmnr llmnr-client llmnr-tcp llmnr-udp managesieve matrix mdns memcache minidlna mongodb mosh mountd mqtt mqtt-tls ms-wbt mssql murmur mysql nbd nebula netbios-ns netdata-dashboard nfs nfs3 nmea-0183 nrpe ntp nut openvpn ovirt-imageio ovirt-storageconsole ovirt-vmconsole plex pmcd pmproxy pmwebapi pmwebapis pop3 pop3s postgresql privoxy prometheus prometheus-node-exporter proxy-dhcp ps2link ps3netsrv ptp pulseaudio puppetmaster quassel radius rdp redis redis-sentinel rpc-bind rquotad rsh rsyncd rtsp salt-master samba samba-client samba-dc sane sip sips slp smtp smtp-submission smtps snmp snmptls snmptls-trap snmptrap spideroak-lansync spotify-sync squid ssdp ssh steam-streaming svdrp svn syncthing syncthing-gui syncthing-relay synergy syslog syslog-tls telnet tentacle tftp tile38 tinc tor-socks transmission-client upnp-client vdsm vnc-server warpinator wbem-http wbem-https wireguard ws-discovery ws-discovery-client ws-discovery-tcp ws-discovery-udp wsman wsmans xdmcp xmpp-bosh xmpp-client xmpp-local xmpp-server zabbix-agent zabbix-server zerotier
[root@srv0 ~]# cd /usr/lib/firewalld/services/
[root@srv0 services]# ls -l
    total 884
    -rw-r--r--. 1 root root 352 Nov  6 16:55 afp.xml
    -rw-r--r--. 1 root root 399 Nov  6 16:55 amanda-client.xml
    -rw-r--r--. 1 root root 427 Nov  6 16:55 amanda-k5-client.xml
    -rw-r--r--. 1 root root 283 Nov  6 16:55 amqps.xml
    -rw-r--r--. 1 root root 273 Nov  6 16:55 amqp.xml
    -rw-r--r--. 1 root root 285 Nov  6 16:55 apcupsd.xml
    -rw-r--r--. 1 root root 301 Nov  6 16:55 audit.xml
    -rw-r--r--. 1 root root 436 Nov  6 16:55 ausweisapp2.xml
    -rw-r--r--. 1 root root 320 Nov  6 16:55 bacula-client.xml
    -rw-r--r--. 1 root root 346 Nov  6 16:55 bacula.xml
    -rw-r--r--. 1 root root 390 Nov  6 16:55 bareos-director.xml
    -rw-r--r--. 1 root root 255 Nov  6 16:55 bareos-filedaemon.xml
    -rw-r--r--. 1 root root 316 Nov  6 16:55 bareos-storage.xml
    -rw-r--r--. 1 root root 429 Nov  6 16:55 bb.xml
    -rw-r--r--. 1 root root 339 Nov  6 16:55 bgp.xml
    -rw-r--r--. 1 root root 275 Nov  6 16:55 bitcoin-rpc.xml
    -rw-r--r--. 1 root root 307 Nov  6 16:55 bitcoin-testnet-rpc.xml
    -rw-r--r--. 1 root root 281 Nov  6 16:55 bitcoin-testnet.xml
    -rw-r--r--. 1 root root 244 Nov  6 16:55 bitcoin.xml
    -rw-r--r--. 1 root root 410 Nov  6 16:55 bittorrent-lsd.xml
    -rw-r--r--. 1 root root 222 Nov  6 16:55 ceph-exporter.xml
    -rw-r--r--. 1 root root 294 Nov  6 16:55 ceph-mon.xml
    -rw-r--r--. 1 root root 329 Nov  6 16:55 ceph.xml
    -rw-r--r--. 1 root root 168 Nov  6 16:55 cfengine.xml
    -rw-r--r--. 1 root root 234 Nov  6 16:55 checkmk-agent.xml
    -rw-r--r--. 1 root root 211 Nov  6 16:55 cockpit.xml
    -rw-r--r--. 1 root root 296 Nov  6 16:55 collectd.xml
    -rw-r--r--. 1 root root 260 Nov  6 16:55 condor-collector.xml
    -rw-r--r--. 1 root root 343 Nov  6 16:55 cratedb.xml
    -rw-r--r--. 1 root root 296 Nov  6 16:55 ctdb.xml
    -rw-r--r--. 1 root root 981 Nov  6 16:55 dds-multicast.xml
    -rw-r--r--. 1 root root 947 Nov  6 16:55 dds-unicast.xml
    -rw-r--r--. 1 root root 574 Nov  6 16:55 dds.xml
    -rw-r--r--. 1 root root 305 Nov  6 16:55 dhcpv6-client.xml
    -rw-r--r--. 1 root root 234 Nov  6 16:55 dhcpv6.xml
    -rw-r--r--. 1 root root 227 Nov  6 16:55 dhcp.xml
    -rw-r--r--. 1 root root 205 Nov  6 16:55 distcc.xml
    -rw-r--r--. 1 root root 318 Nov  6 16:55 dns-over-tls.xml
    -rw-r--r--. 1 root root 346 Nov  6 16:55 dns.xml
    -rw-r--r--. 1 root root 374 Nov  6 16:55 docker-registry.xml
    -rw-r--r--. 1 root root 391 Nov  6 16:55 docker-swarm.xml
    -rw-r--r--. 1 root root 228 Nov  6 16:55 dropbox-lansync.xml
    -rw-r--r--. 1 root root 338 Nov  6 16:55 elasticsearch.xml
    -rw-r--r--. 1 root root 304 Nov  6 16:55 etcd-client.xml
    -rw-r--r--. 1 root root 304 Nov  6 16:55 etcd-server.xml
    -rw-r--r--. 1 root root 224 Nov  6 16:55 finger.xml
    -rw-r--r--. 1 root root 270 Nov  6 16:55 foreman-proxy.xml
    -rw-r--r--. 1 root root 408 Nov  6 16:55 foreman.xml
    -rw-r--r--. 1 root root 709 Nov  6 16:55 freeipa-4.xml
    -rw-r--r--. 1 root root 489 Nov  6 16:55 freeipa-ldaps.xml
    -rw-r--r--. 1 root root 488 Nov  6 16:55 freeipa-ldap.xml
    -rw-r--r--. 1 root root 242 Nov  6 16:55 freeipa-replication.xml
    -rw-r--r--. 1 root root 657 Nov  6 16:55 freeipa-trust.xml
    -rw-r--r--. 1 root root 361 Nov  6 16:55 ftp.xml
    -rw-r--r--. 1 root root 292 Nov  6 16:55 galera.xml
    -rw-r--r--. 1 root root 184 Nov  6 16:55 ganglia-client.xml
    -rw-r--r--. 1 root root 176 Nov  6 16:55 ganglia-master.xml
    -rw-r--r--. 1 root root 212 Nov  6 16:55 git.xml
    -rw-r--r--. 1 root root 406 Nov  6 16:55 gpsd.xml
    -rw-r--r--. 1 root root 218 Nov  6 16:55 grafana.xml
    -rw-r--r--. 1 root root 119 Nov  6 16:55 gre.xml
    -rw-r--r--. 1 root root 608 Nov  6 16:55 high-availability.xml
    -rw-r--r--. 1 root root 336 Nov  6 16:55 http3.xml
    -rw-r--r--. 1 root root 448 Nov  6 16:55 https.xml
    -rw-r--r--. 1 root root 353 Nov  6 16:55 http.xml
    -rw-r--r--. 1 root root 293 Nov  6 16:55 ident.xml
    -rw-r--r--. 1 root root 372 Nov  6 16:55 imaps.xml
    -rw-r--r--. 1 root root 327 Nov  6 16:55 imap.xml
    -rw-r--r--. 1 root root 315 Nov  6 16:55 ipfs.xml
    -rw-r--r--. 1 root root 454 Nov  6 16:55 ipp-client.xml
    -rw-r--r--. 1 root root 427 Nov  6 16:55 ipp.xml
    -rw-r--r--. 1 root root 895 Nov  6 16:55 ipsec.xml
    -rw-r--r--. 1 root root 255 Nov  6 16:55 ircs.xml
    -rw-r--r--. 1 root root 247 Nov  6 16:55 irc.xml
    -rw-r--r--. 1 root root 264 Nov  6 16:55 iscsi-target.xml
    -rw-r--r--. 1 root root 358 Nov  6 16:55 isns.xml
    -rw-r--r--. 1 root root 213 Nov  6 16:55 jenkins.xml
    -rw-r--r--. 1 root root 182 Nov  6 16:55 kadmin.xml
    -rw-r--r--. 1 root root 272 Nov  6 16:55 kdeconnect.xml
    -rw-r--r--. 1 root root 233 Nov  6 16:55 kerberos.xml
    -rw-r--r--. 1 root root 384 Nov  6 16:55 kibana.xml
    -rw-r--r--. 1 root root 249 Nov  6 16:55 klogin.xml
    -rw-r--r--. 1 root root 221 Nov  6 16:55 kpasswd.xml
    -rw-r--r--. 1 root root 182 Nov  6 16:55 kprop.xml
    -rw-r--r--. 1 root root 242 Nov  6 16:55 kshell.xml
    -rw-r--r--. 1 root root 308 Nov  6 16:55 kube-apiserver.xml
    -rw-r--r--. 1 root root 204 Nov  6 16:55 kube-api.xml
    -rw-r--r--. 1 root root 289 Nov  6 16:55 kube-controller-manager-secure.xml
    -rw-r--r--. 1 root root 280 Nov  6 16:55 kube-controller-manager.xml
    -rw-r--r--. 1 root root 560 Nov  6 16:55 kube-control-plane-secure.xml
    -rw-r--r--. 1 root root 537 Nov  6 16:55 kube-control-plane.xml
    -rw-r--r--. 1 root root 244 Nov  6 16:55 kubelet-readonly.xml
    -rw-r--r--. 1 root root 212 Nov  6 16:55 kubelet-worker.xml
    -rw-r--r--. 1 root root 239 Nov  6 16:55 kubelet.xml
    -rw-r--r--. 1 root root 224 Nov  6 16:55 kube-nodeport-services.xml
    -rw-r--r--. 1 root root 328 Nov  6 16:55 kube-scheduler-secure.xml
    -rw-r--r--. 1 root root 319 Nov  6 16:55 kube-scheduler.xml
    -rw-r--r--. 1 root root 374 Nov  6 16:55 kube-worker.xml
    -rw-r--r--. 1 root root 232 Nov  6 16:55 ldaps.xml
    -rw-r--r--. 1 root root 199 Nov  6 16:55 ldap.xml
    -rw-r--r--. 1 root root 385 Nov  6 16:55 libvirt-tls.xml
    -rw-r--r--. 1 root root 389 Nov  6 16:55 libvirt.xml
    -rw-r--r--. 1 root root 269 Nov  6 16:55 lightning-network.xml
    -rw-r--r--. 1 root root 468 Nov  6 16:55 llmnr-client.xml
    -rw-r--r--. 1 root root 410 Nov  6 16:55 llmnr-tcp.xml
    -rw-r--r--. 1 root root 463 Nov  6 16:55 llmnr-udp.xml
    -rw-r--r--. 1 root root 519 Nov  6 16:55 llmnr.xml
    -rw-r--r--. 1 root root 349 Nov  6 16:55 managesieve.xml
    -rw-r--r--. 1 root root 432 Nov  6 16:55 matrix.xml
    -rw-r--r--. 1 root root 424 Nov  6 16:55 mdns.xml
    -rw-r--r--. 1 root root 245 Nov  6 16:55 memcache.xml
    -rw-r--r--. 1 root root 334 Nov  6 16:55 minidlna.xml
    -rw-r--r--. 1 root root 237 Nov  6 16:55 mongodb.xml
    -rw-r--r--. 1 root root 473 Nov  6 16:55 mosh.xml
    -rw-r--r--. 1 root root 211 Nov  6 16:55 mountd.xml
    -rw-r--r--. 1 root root 296 Nov  6 16:55 mqtt-tls.xml
    -rw-r--r--. 1 root root 287 Nov  6 16:55 mqtt.xml
    -rw-r--r--. 1 root root 170 Nov  6 16:55 mssql.xml
    -rw-r--r--. 1 root root 180 Nov  6 16:55 ms-wbt.xml
    -rw-r--r--. 1 root root 242 Nov  6 16:55 murmur.xml
    -rw-r--r--. 1 root root 171 Nov  6 16:55 mysql.xml
    -rw-r--r--. 1 root root 250 Nov  6 16:55 nbd.xml
    -rw-r--r--. 1 root root 309 Nov  6 16:55 nebula.xml
    -rw-r--r--. 1 root root 262 Nov  6 16:55 netbios-ns.xml
    -rw-r--r--. 1 root root 243 Nov  6 16:55 netdata-dashboard.xml
    -rw-r--r--. 1 root root 342 Nov  6 16:55 nfs3.xml
    -rw-r--r--. 1 root root 324 Nov  6 16:55 nfs.xml
    -rw-r--r--. 1 root root 293 Nov  6 16:55 nmea-0183.xml
    -rw-r--r--. 1 root root 247 Nov  6 16:55 nrpe.xml
    -rw-r--r--. 1 root root 389 Nov  6 16:55 ntp.xml
    -rw-r--r--. 1 root root 368 Nov  6 16:55 nut.xml
    -rw-r--r--. 1 root root 335 Nov  6 16:55 openvpn.xml
    -rw-r--r--. 1 root root 260 Nov  6 16:55 ovirt-imageio.xml
    -rw-r--r--. 1 root root 343 Nov  6 16:55 ovirt-storageconsole.xml
    -rw-r--r--. 1 root root 235 Nov  6 16:55 ovirt-vmconsole.xml
    -rw-r--r--. 1 root root 869 Nov  6 16:55 plex.xml
    -rw-r--r--. 1 root root 433 Nov  6 16:55 pmcd.xml
    -rw-r--r--. 1 root root 474 Nov  6 16:55 pmproxy.xml
    -rw-r--r--. 1 root root 544 Nov  6 16:55 pmwebapis.xml
    -rw-r--r--. 1 root root 460 Nov  6 16:55 pmwebapi.xml
    -rw-r--r--. 1 root root 357 Nov  6 16:55 pop3s.xml
    -rw-r--r--. 1 root root 348 Nov  6 16:55 pop3.xml
    -rw-r--r--. 1 root root 181 Nov  6 16:55 postgresql.xml
    -rw-r--r--. 1 root root 509 Nov  6 16:55 privoxy.xml
    -rw-r--r--. 1 root root 226 Nov  6 16:55 prometheus-node-exporter.xml
    -rw-r--r--. 1 root root 213 Nov  6 16:55 prometheus.xml
    -rw-r--r--. 1 root root 261 Nov  6 16:55 proxy-dhcp.xml
    -rw-r--r--. 1 root root 262 Nov  6 16:55 ps2link.xml
    -rw-r--r--. 1 root root 173 Nov  6 16:55 ps3netsrv.xml
    -rw-r--r--. 1 root root 424 Nov  6 16:55 ptp.xml
    -rw-r--r--. 1 root root 414 Nov  6 16:55 pulseaudio.xml
    -rw-r--r--. 1 root root 297 Nov  6 16:55 puppetmaster.xml
    -rw-r--r--. 1 root root 273 Nov  6 16:55 quassel.xml
    -rw-r--r--. 1 root root 520 Nov  6 16:55 radius.xml
    -rw-r--r--. 1 root root 183 Nov  6 16:55 rdp.xml
    -rw-r--r--. 1 root root 212 Nov  6 16:55 redis-sentinel.xml
    -rw-r--r--. 1 root root 268 Nov  6 16:55 redis.xml
    -rw-r--r--. 1 root root 381 Nov  6 16:55 RH-Satellite-6-capsule.xml
    -rw-r--r--. 1 root root 556 Nov  6 16:55 RH-Satellite-6.xml
    -rw-r--r--. 1 root root 214 Nov  6 16:55 rpc-bind.xml
    -rw-r--r--. 1 root root 213 Nov  6 16:55 rquotad.xml
    -rw-r--r--. 1 root root 310 Nov  6 16:55 rsh.xml
    -rw-r--r--. 1 root root 311 Nov  6 16:55 rsyncd.xml
    -rw-r--r--. 1 root root 350 Nov  6 16:55 rtsp.xml
    -rw-r--r--. 1 root root 329 Nov  6 16:55 salt-master.xml
    -rw-r--r--. 1 root root 339 Nov  6 16:55 samba-client.xml
    -rw-r--r--. 1 root root 782 Nov  6 16:55 samba-dc.xml
    -rw-r--r--. 1 root root 382 Nov  6 16:55 samba.xml
    -rw-r--r--. 1 root root 324 Nov  6 16:55 sane.xml
    -rw-r--r--. 1 root root 283 Nov  6 16:55 sips.xml
    -rw-r--r--. 1 root root 496 Nov  6 16:55 sip.xml
    -rw-r--r--. 1 root root 299 Nov  6 16:55 slp.xml
    -rw-r--r--. 1 root root 231 Nov  6 16:55 smtp-submission.xml
    -rw-r--r--. 1 root root 577 Nov  6 16:55 smtps.xml
    -rw-r--r--. 1 root root 550 Nov  6 16:55 smtp.xml
    -rw-r--r--. 1 root root 359 Nov  6 16:55 snmptls-trap.xml
    -rw-r--r--. 1 root root 390 Nov  6 16:55 snmptls.xml
    -rw-r--r--. 1 root root 308 Nov  6 16:55 snmptrap.xml
    -rw-r--r--. 1 root root 342 Nov  6 16:55 snmp.xml
    -rw-r--r--. 1 root root 405 Nov  6 16:55 spideroak-lansync.xml
    -rw-r--r--. 1 root root 275 Nov  6 16:55 spotify-sync.xml
    -rw-r--r--. 1 root root 173 Nov  6 16:55 squid.xml
    -rw-r--r--. 1 root root 421 Nov  6 16:55 ssdp.xml
    -rw-r--r--. 1 root root 463 Nov  6 16:55 ssh.xml
    -rw-r--r--. 1 root root 631 Nov  6 16:55 steam-streaming.xml
    -rw-r--r--. 1 root root 287 Nov  6 16:55 svdrp.xml
    -rw-r--r--. 1 root root 231 Nov  6 16:55 svn.xml
    -rw-r--r--. 1 root root 297 Nov  6 16:55 syncthing-gui.xml
    -rw-r--r--. 1 root root 414 Nov  6 16:55 syncthing-relay.xml
    -rw-r--r--. 1 root root 350 Nov  6 16:55 syncthing.xml
    -rw-r--r--. 1 root root 496 Nov  6 16:55 synergy.xml
    -rw-r--r--. 1 root root 444 Nov  6 16:55 syslog-tls.xml
    -rw-r--r--. 1 root root 329 Nov  6 16:55 syslog.xml
    -rw-r--r--. 1 root root 393 Nov  6 16:55 telnet.xml
    -rw-r--r--. 1 root root 252 Nov  6 16:55 tentacle.xml
    -rw-r--r--. 1 root root 424 Nov  6 16:55 tftp.xml
    -rw-r--r--. 1 root root 221 Nov  6 16:55 tile38.xml
    -rw-r--r--. 1 root root 336 Nov  6 16:55 tinc.xml
    -rw-r--r--. 1 root root 771 Nov  6 16:55 tor-socks.xml
    -rw-r--r--. 1 root root 244 Nov  6 16:55 transmission-client.xml
    -rw-r--r--. 1 root root 264 Nov  6 16:55 upnp-client.xml
    -rw-r--r--. 1 root root 593 Nov  6 16:55 vdsm.xml
    -rw-r--r--. 1 root root 475 Nov  6 16:55 vnc-server.xml
    -rw-r--r--. 1 root root 443 Nov  6 16:55 warpinator.xml
    -rw-r--r--. 1 root root 310 Nov  6 16:55 wbem-https.xml
    -rw-r--r--. 1 root root 352 Nov  6 16:55 wbem-http.xml
    -rw-r--r--. 1 root root 285 Nov  6 16:55 wireguard.xml
    -rw-r--r--. 1 root root 355 Nov  6 16:55 ws-discovery-client.xml
    -rw-r--r--. 1 root root 320 Nov  6 16:55 ws-discovery-tcp.xml
    -rw-r--r--. 1 root root 375 Nov  6 16:55 ws-discovery-udp.xml
    -rw-r--r--. 1 root root 357 Nov  6 16:55 ws-discovery.xml
    -rw-r--r--. 1 root root 323 Nov  6 16:55 wsmans.xml
    -rw-r--r--. 1 root root 316 Nov  6 16:55 wsman.xml
    -rw-r--r--. 1 root root 329 Nov  6 16:55 xdmcp.xml
    -rw-r--r--. 1 root root 509 Nov  6 16:55 xmpp-bosh.xml
    -rw-r--r--. 1 root root 488 Nov  6 16:55 xmpp-client.xml
    -rw-r--r--. 1 root root 264 Nov  6 16:55 xmpp-local.xml
    -rw-r--r--. 1 root root 545 Nov  6 16:55 xmpp-server.xml
    -rw-r--r--. 1 root root 314 Nov  6 16:55 zabbix-agent.xml
    -rw-r--r--. 1 root root 315 Nov  6 16:55 zabbix-server.xml
    -rw-r--r--. 1 root root 242 Nov  6 16:55 zerotier.xml
[root@srv0 services]# cp http.xml /etc/firewalld/services
[root@srv0 services]# cd /etc/firewalld/services/
[root@srv0 services]# ls -lt
    total 4
    -rw-r--r--. 1 root root 353 Mar 17 22:31 http.xml
[root@srv0 services]# cd -
    /usr/lib/firewalld/services
[root@srv0 services]# cd -
    /etc/firewalld/services
[root@srv0 services]# pwd
    /etc/firewalld/services
[root@srv0 services]# cat http.xml
    <?xml version="1.0" encoding="utf-8"?>
    <service>
      <short>WWW (HTTP)</short>
      <description>HTTP is the protocol used to serve Web pages. If you plan to make your Web server publicly available, enable this option. This option is not required for viewing pages locally or developing Web pages.</description>
      <port protocol="tcp" port="80"/>
    </service>
[root@srv0 services]# vi http.xml
    <?xml version="1.0" encoding="utf-8"?>
    <service>
      <short>WWW (HTTP)</short>
      <description>HTTP is the protocol used to serve Web pages. If you plan to make your Web server publicly available, enable this option. This option is not required for viewing pages locally or developing Web pages.</description>
      <port protocol="tcp" port="8080"/>
    </service>

[root@srv0 services]# mv http.xml myhttp.xml
[root@srv0 services]# ls -l
    total 4
    -rw-r--r--. 1 root root 390 Mar 17 22:33 myhttp.xml
[root@srv0 services]# firewall-cmd --reload
    success
[root@srv0 services]# firewall-cmd --get-services | grep myhttp
    RH-Satellite-6 RH-Satellite-6-capsule afp amanda-client amanda-k5-client amqp amqps apcupsd audit ausweisapp2 bacula bacula-client bareos-director bareos-filedaemon bareos-storage bb bgp bitcoin bitcoin-rpc bitcoin-testnet bitcoin-testnet-rpc bittorrent-lsd ceph ceph-exporter ceph-mon cfengine checkmk-agent cockpit collectd condor-collector cratedb ctdb dds dds-multicast dds-unicast dhcp dhcpv6 dhcpv6-client distcc dns dns-over-tls docker-registry docker-swarm dropbox-lansync elasticsearch etcd-client etcd-server finger foreman foreman-proxy freeipa-4 freeipa-ldap freeipa-ldaps freeipa-replication freeipa-trust ftp galera ganglia-client ganglia-master git gpsd grafana gre high-availability http http3 https ident imap imaps ipfs ipp ipp-client ipsec irc ircs iscsi-target isns jenkins kadmin kdeconnect kerberos kibana klogin kpasswd kprop kshell kube-api kube-apiserver kube-control-plane kube-control-plane-secure kube-controller-manager kube-controller-manager-secure kube-nodeport-services kube-scheduler kube-scheduler-secure kube-worker kubelet kubelet-readonly kubelet-worker ldap ldaps libvirt libvirt-tls lightning-network llmnr llmnr-client llmnr-tcp llmnr-udp managesieve matrix mdns memcache minidlna mongodb mosh mountd mqtt mqtt-tls ms-wbt mssql murmur myhttp mysql nbd nebula netbios-ns netdata-dashboard nfs nfs3 nmea-0183 nrpe ntp nut openvpn ovirt-imageio ovirt-storageconsole ovirt-vmconsole plex pmcd pmproxy pmwebapi pmwebapis pop3 pop3s postgresql privoxy prometheus prometheus-node-exporter proxy-dhcp ps2link ps3netsrv ptp pulseaudio puppetmaster quassel radius rdp redis redis-sentinel rpc-bind rquotad rsh rsyncd rtsp salt-master samba samba-client samba-dc sane sip sips slp smtp smtp-submission smtps snmp snmptls snmptls-trap snmptrap spideroak-lansync spotify-sync squid ssdp ssh steam-streaming svdrp svn syncthing syncthing-gui syncthing-relay synergy syslog syslog-tls telnet tentacle tftp tile38 tinc tor-socks transmission-client upnp-client vdsm vnc-server warpinator wbem-http wbem-https wireguard ws-discovery ws-discovery-client ws-discovery-tcp ws-discovery-udp wsman wsmans xdmcp xmpp-bosh xmpp-client xmpp-local xmpp-server zabbix-agent zabbix-server zerotier

[root@srv0 services]# firewall-cmd --add-service=myhttp
    success

[root@srv0 services]# firewall-cmd --list-services
    cockpit dhcpv6-client http mountd myhttp nfs rpc-bind ssh

[root@srv0 services]# firewall-cmd --permanent --remove-service=http
    success

[root@srv0 services]# firewall-cmd --reload
    success

[root@srv0 services]# firewall-cmd --list-services
    cockpit dhcpv6-client mountd nfs rpc-bind ssh
[root@srv0 services]# firewall-cmd --add-service=myhttp
    success
[root@srv0 services]# firewall-cmd --list-services
    cockpit dhcpv6-client mountd myhttp nfs rpc-bind ssh

[root@srv0 services]# cd /etc/httpd/conf.d/
[root@srv0 conf.d]# ls -l
    total 20
    -rw-r--r--. 1 root root 2916 Feb 14 09:32 autoindex.conf
    -rw-r--r--. 1 root root  400 Feb 14 09:32 README
    -rw-r--r--. 1 root root  267 Mar 10 13:41 rhel.conf
    -rw-r--r--. 1 root root 1252 Feb 14 09:29 userdir.conf
    -rw-r--r--. 1 root root  653 Feb 14 09:29 welcome.old

[root@srv0 conf.d]# cat rhel.conf
    <VirtualHost *:80>
            ServerAdmin meuemail@exemplo.com
            DocumentRoot /var/www/html/rhel
            ServerName rhel.temweb.local
            ErrorLog logs/rhel.temweb.local-error-log
            CustomLog logs/rhel.temweb.local-custom-error-log common
    </VirtualHost>

[root@srv0 conf.d]# vi rhel.conf
    Listen 8080
    <VirtualHost *:8080>
            ServerAdmin meuemail@exemplo.com
            DocumentRoot /var/www/html/rhel
            ServerName rhel.temweb.local
            ErrorLog logs/rhel.temweb.local-error-log
            CustomLog logs/rhel.temweb.local-custom-error-log common
    </VirtualHost>
# /-/-/-/-/-/-/-/-/-/-/-/ ------------- desk ------------- /-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/
[root@desk ~]# telnet rhel 80
    Trying 192.168.0.10...
    telnet: connect to address 192.168.0.10: No route to host

[root@desk ~]# telnet rhel 8080
    Trying 192.168.0.10...
    Connected to rhel.
    Escape character is '^]'.
# /-/-/-/-/-/-/-/-/-/-/-/ ------------- srv0 ------------- /-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/



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
