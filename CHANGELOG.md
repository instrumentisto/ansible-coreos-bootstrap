Change Log
==========

All user visible changes to this project will be documented in this file. This project uses to [Semantic Versioning 2.0.0].




## [2.0.0] · 2018-??-??

[Diff](https://github.com/instrumentisto/ansible-coreos-bootstrap/compare/1.0.0...2.0.0)

#### BC Breaks

- Switch to [Python 3.5] in [PyPy] (#3).
- Move installation into `/opt/python/` directory by default (#3).
- Require `min_ansible_version: 2.5` (#3).

#### Added

- Configurable installation directory via `ansible_python_dir` variable (#3).

#### Changed

- Separate installation checks for [PyPy] and [pip] (#3).




## [1.0.0] · 2018-08-21

[Diff](https://github.com/instrumentisto/ansible-coreos-bootstrap/compare/forked...1.0.0)

#### Changed

- Switch to [portable PyPy] and upgrade [PyPy] to [6.0.0](http://doc.pypy.org/en/latest/release-v6.0.0.html) version ([85d50cc](https://github.com/instrumentisto/ansible-coreos-bootstrap/commit/85d50cc96616506ae57173b1adbbee09d7f2dd29)).

#### Fixed

- Update syntax to omit warnings from new [Ansible] versions ([a791c2c](https://github.com/instrumentisto/ansible-coreos-bootstrap/commit/a791c2c5705a5d1a30ec503907f938b6bc221d3a)).





[2.0.0]: https://github.com/instrumentisto/ansible-coreos-bootstrap/tree/2.0.0
[1.0.0]: https://github.com/instrumentisto/ansible-coreos-bootstrap/tree/1.0.0

[Ansible]: https://www.ansible.com
[pip]: https://pypi.org/project/pip
[portable PyPy]: https://github.com/squeaky-pl/portable-pypy
[PyPy]: https://pypy.org
[Python 3.5]: https://www.python.org/downloads/release/python-350
[Semantic Versioning 2.0.0]: https://semver.org
