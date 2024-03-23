# Configure um repositório de instalação local usando o repositório da máquina srv0
[root@dev1 ~]# cd /etc/yum.repos.d/
[root@dev1 yum.repos.d]# vi lab_repo.repo
    [Lab_Repo]
    name=Lab 8 - Local Repo
    baseurl=http://rhel.temweb.local
    enabled=1
    gpgcheck=0
[root@dev1 yum.repos.d]# dnf repolist
    repo id                                  repo name
    Lab_Repo                                 Lab 8 - Local Repo
    appstream                                CentOS Stream 9 - AppStream
    baseos                                   CentOS Stream 9 - BaseOS
    extras-common                            CentOS Stream 9 - Extras packages
    my_AppStream                             my_appstream
    my_BaseOS                                my_baseos