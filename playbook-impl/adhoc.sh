ansible allnodes -m user -a "user=userone state=present" -u root -k
ansible allnodes -m authorized_key -a "user=userone state=present key={{ lookup('file','/home/devops/.ssh/id_rsa.pub') }}" -u root -k
ansible allnodes -m copy -a "content='userone   ALL=(ALL)   NOPASSWD: ALL' dest=/etc/sudoers.d/userone mode=0440 validate='/usr/sbin/visudo -cf %s'" -u root -k
