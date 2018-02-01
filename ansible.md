# Ansible

From redhat

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

* `playbooks` > `plays` > `tasks` call-> `modules`
* `tasks` run sequentially
* `handlers` are triggered by `tasks`, run once at the end of plays

# modules
has 450 default modules

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
```

check mode dry-run: for validate playbook runs before making state changes on target systems

+ -C => check
```
ansible web -C -m yum -a "name=httpd state=latest"
ansible-playbook -C my-playbook.yml
```

