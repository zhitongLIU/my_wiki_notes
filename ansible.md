# Ansible

From redhat
https://www.bilibili.com/video/av33611758
https://www.bilibili.com/video/av25424954?from=search&seid=10718251934342931271

# advantage
- server less
- ssh/wimrm

* inventory - list of hosts
* playbooks - commands

+ installing package
+ calling api from server


# on node
install ansible
```
yum -y install ansible
```

# playbooks
Instruction to launch for software installation or update

It is written in yaml Format

can use variables

* `roles` > `playbooks` > `plays` > `tasks` call-> `modules`
* `tasks` run sequentially
* `handlers` are triggered by `tasks`, run once at the end of plays

# modules
has 450 default modules
1300 at 2019

standar structure
`module: directive1=value directive2=value`

http://docs.ansible.com/ansible/modules_by_category.html


# inventory
```
---
[web]
www.sth.com

[db]
db-sth.com
```


## Roles
like a playbook, self-containted task

# commands
from controll node

running modules
+ -m => modules
+ -a => args
```
ansible <inventory> <options>
ansible web -a /bin/date
ansible web -m ping
ansible web -m yum -a "name=openssl state=latest"
```

running playbooks
```
ansible-playbook my-playbook.yml
ansible-playbook my-playbook.yml --limit 192.168.1.10
ansible-playbook my-playbook.yml --list-hosts
ansible-playbook my-playbook.yml --list-tasks
ansible-playbook my-playbook.yml --list-tags
```

check mode dry-run: for validate playbook runs before making state changes on target systems

+ -C => check
```
ansible web -C -m yum -a "name=httpd state=latest"
ansible-playbook -C my-playbook.yml
```

## play -> Yaml
```
---
- hosts: webservices
  remote_user: root

  tasks:
    - name: abc
      command: hostname
    - name: create new file
      file: name=/path/to/file state=touch
      ignore_errors: True
```

### list
```
- a
- b
- c
- d
```
### Dictionary

```
name: blabla
job: toto
# or
{ name: blabla, job: toto }
```

####commands
```
# centos
# check if httpd is installed
rpm -q httpd
# list all httpd related files
rpm -ql httpd

# check a user is created
getent passwd testuser
```


## handlers & notify
```
---
- hosts: webservices
  remote_user: root

  tasks:
    - name: install httpd
      yum: name=httpd
    - name: copy conf
      copy: name=files/httpd.conf dest=/etc/httpd/conf backup=yes
      # notify handle to restart server if config has been changed
      notify:
        - restart server
    - name: start server
      service: name=httpd state=started enabled=yes

  handlers:
    - name: restart server
      service: name=httpd state=restarted
```

## tags
```
---
- hosts: webservices
  remote_user: root

  tasks:
    - name: install httpd
      yum: name=httpd
    - name: copy conf
      copy: name=files/httpd.conf dest=/etc/httpd/conf backup=yes
    - name: start server
      service: name=httpd state=started enabled=yes
      tags: starthttp


ansible-playbook -t starthttp my-playbook.yml
```
ps: tasks can have same tags, it will play every tasks that has the same tag sequentially

## variables
###define in command
```
---
- hosts: webservices
  remote_user: root

  tasks:
    - name: install package
      yum: name={{ pkname }}
    - name: start server
      service: name={{ pkname }} state=started enabled=yes
      tags: starthttp


ansible-playbook my-playbook.yml -e 'pkname=httpd'
```
### or define in play
```
---
- hosts: webservices
  remote_user: root
  vars:
    - pkname1: httpd
    - pkname2: vsftpd

  tasks:
    - name: install package
      yum: name={{ pkname1 }}
    - name: install package2
      yum: name={{ pkname2 }}

ansible-playbook my-playbook.yml
```
### or using vars_files
```
---
- hosts: webservices
  remote_user: root
  vars_files:
    - vars.yml

  tasks:
    - name: install package
      yum: name={{ pkname1 }}
    - name: install package2
      yum: name={{ pkname2 }}


#vars.yml
---
var1: httpd
var2: vsftpd

ansible-playbook my-playbook.yml
```
### in etc/ansible/hosts
```
[webservice]
198.0.1.1 http_port=80

[webservice:vars]
http_port=81
```
