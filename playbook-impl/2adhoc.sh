ansible all -m user -a "name=automation state=present" -u root -k
ansible all -m authorized_key -a "user=automation key={{ lookup('file', /home/automation/.ssh/id_rsa.pub) }} state=present" -u root -k
ansible all -m copy -a "content='automation   ALL=(ALL)   NOPASSWD: ALL' dest=/etc/sudoers.d/automation state=present mode=0440 owner=root group=root validate='/usr/sbin/visudo -cf %s'" -u root -k

