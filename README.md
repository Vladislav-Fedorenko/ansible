# ansible-scripts

## What is this repository for?
* Configure environment on remote hosts (postgres, nginx, api-service, etc.)
* Manage ssh keys on remote hosts

## Get started
* Install ansible
* Add your ssh-key on remote hosts

### How to play playbook
```
ansible-playbook -i hosts ./playbooks/some-playbook.yml
```

#### If you want to execute some tasks, not all playbook - use the tags
```
ansible-playbook -i hosts ./playbooks/some-playbook.yml -t some:tag
```

### How to test a playbook on localhost (using vagrant)

```
$ cd vagrant
$ bash install.sh
$ vagrant up
$ cd ../
$ ansible-playbook -i hosts-vagrant ./playbooks/some-playbook.yml
```

Connect to vagrant machine:
```
ssh root@192.168.33.10
ssh root@192.168.33.11
```

## How to manage ssh keys on remote hosts
* add key of a user which you want give access to `roles/ssh-keys/files/present-keys`
* move key of the user which you want to take away access `roles/ssh-keys/files/present-keys` to `roles/ssh-keys/files/absent-keys`
* execute `ansible-playbook -i inventory-file ./playbooks/ssh.yml`

## How to configure environment on hosts

* Read some important info about executing roles and playbooks:
  * "postgres" role:
    - username and password should be configured manually (or actualized after executing)
    - version of database can be configured using variable
  * "zabbix" role:
     - password for user on production env should be set manually (default vars)
