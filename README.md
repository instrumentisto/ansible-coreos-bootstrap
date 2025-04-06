coreos-bootstrap
================

[![GitHub release](https://img.shields.io/github/release/instrumentisto/ansible-coreos-bootstrap.svg)](https://github.com/instrumentisto/ansible-coreos-bootstrap/releases/latest) [![Build Status](https://travis-ci.org/instrumentisto/ansible-coreos-bootstrap.svg?branch=master)](https://travis-ci.org/instrumentisto/ansible-coreos-bootstrap) [![Python](https://img.shields.io/badge/Python-3.11-blue.svg)](https://www.pypy.org/) [![PyPy](https://img.shields.io/badge/PyPy-7.3.19-blue.svg)](https://www.pypy.org/)

Control [Fedora CoreOS] with Ansible.

In order to effectively run [Ansible], the target machine needs to have a [Python] interpreter. [Fedora CoreOS] machines are minimal and do not ship with any version of [Python]. To get around this limitation we can install [PyPy], a lightweight [Python] interpreter. The `coreos-bootstrap` role will install [PyPy] for us and we will update our inventory file to use the installed python interpreter.


## Installing Python on Fedora CoreOS

At the moment, installing Python on [Fedora CoreOS] is not quite straightforward.

You might need to disable [SELinux] or to use workarounds from [How to make ansible work in Fedora CoreOS again (coreos/fedora-coreos-tracker#592)](https://github.com/coreos/fedora-coreos-tracker/issues/592).

## Install

Add to your `requirements.yml`:
```yaml
- name: instrumentisto.coreos-bootstrap
  src: git+https://github.com/instrumentisto/ansible-coreos-bootstrap
  version: master
```

And resolve your dependencies:
```bash
ansible-galaxy install -r requirements.yml
```

Or add the role directly:
```bash
ansible-galaxy install git+https://github.com/instrumentisto/ansible-coreos-bootstrap
```




## Configure your project

Unlike a typical role, you need to configure [Ansible] to use an alternative [Python] interpreter for [CoreOS] hosts. This can be done by adding a `coreos` group to your inventory file and setting the group's vars to use the new [Python] interpreter. This way, you can use [Ansible] to manage [CoreOS] and non-[CoreOS] hosts. Simply put every host that has [CoreOS] into the `coreos` inventory group and it will automatically use the specified [Python] interpreter.
```ini
[coreos]
host-01
host-02
```

The role sets defaults for these, but you can set them yourself just in case:
```ini
[coreos:vars]
ansible_ssh_user=core
ansible_python_interpreter=/opt/python/bin/python
```

This will configure [Ansible] to use the [Python] interpreter at `/opt/python/bin/python` which will be created by the `coreos-bootstrap` role.




## Bootstrap Playbook

Now you can simply add the following to your playbook file and include it in your `site.yml` so that it runs on all hosts in the `coreos` group.

```yaml
- hosts: coreos
  gather_facts: False
  become: yes
  roles:
    - instrumentisto.coreos-bootstrap
```

Make sure that `gather_facts` is set to `False`, otherwise [Ansible] will try to first gather system facts using [Python] which is __not yet installed__!




## Example Playbook

After bootstrap, you can use [Ansible] as usual to manage system services, install [Python] modules (via `pip`), and run containers. Below is a basic example that starts the `etcd` service, installs the `docker-py` module and then uses the [Ansible] `docker` module to pull and start a basic [Nginx] container.

```yaml
- name: Nginx Example
  hosts: web
  become_method: sudo
  become: yes
  tasks:
    - name: Start etcd
      systemd:
        name: etcd.service
        state: started

    - name: Install docker-py
      pip:
        name: docker-py
        state: present
        executable: /opt/python/bin/pip

    - name: Pull container
      raw: docker pull nginx:1.7.1

    - name: Launch Nginx container
      docker:
        name: example-nginx
        image: nginx:1.7.1
        ports: "8080:80"
        state: running
```




## License

[MIT](LICENSE.md)





[Ansible]: https://docs.ansible.com
[Fedora CoreOS]: https://getfedora.org/en/coreos
[Nginx]: https://hub.docker.com/_/nginx
[PyPy]: http://pypy.org
[Python]: https://www.python.org
[SELinux]: https://www.redhat.com/en/topics/linux/what-is-selinux
