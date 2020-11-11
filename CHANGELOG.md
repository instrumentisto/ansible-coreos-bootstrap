Change Log
==========

All user visible changes to this project will be documented in this file. This project uses to [Semantic Versioning 2.0.0].




## [3.0.0] · 2020-11-??

[Diff](https://github.com/instrumentisto/ansible-coreos-bootstrap/compare/2.1.0...3.0.0)

#### BC Breaks

- Drop support for [Container Linux CoreOS] ([#10]).
- Switch from [portable PyPy] to official [PyPy] builds ([squeaky-pl/portable-pypy#97], [#10]).

#### Added

- Support for [Fedora CoreOS] ([#10]).

#### Changed

- Upgrade [PyPy] to [7.3.2][PyPy 7.3.2] ([#10]).

[squeaky-pl/portable-pypy#97]: https://github.com/squeaky-pl/portable-pypy/issues/97
[#10]: https://github.com/instrumentisto/ansible-coreos-bootstrap/pull/7




## [2.1.0] · 2020-10-19

[Diff](https://github.com/instrumentisto/ansible-coreos-bootstrap/compare/2.0.0...2.1.0)

#### Added

- Ability to override download URL for [PyPy] ([#7], [#6]).

#### Changed

- Use GitHub releases instead of BitBucket for downloading [portable PyPy] ([#5]).
- Upgrade Python to [3.6][Python 3.6] version and [PyPy] to [7.2.0][PyPy 7.2.0] version ([#5]).

#### Fixed

- [pip] launcher installing ([31e9fb9]).
- `.bootstrapped` file creation ([2e0dfbd]).

[#5]: https://github.com/instrumentisto/ansible-coreos-bootstrap/pull/5
[#6]: https://github.com/instrumentisto/ansible-coreos-bootstrap/issues/6
[#7]: https://github.com/instrumentisto/ansible-coreos-bootstrap/pull/7
[31e9fb9]: https://github.com/instrumentisto/ansible-coreos-bootstrap/commit/31e9fb9e7119e85c39bc1938c15c5df75b8ecad9
[2e0dfbd]: https://github.com/instrumentisto/ansible-coreos-bootstrap/commit/2e0dfbd4b47d623e75c287ca3f2b31ced163ead3




## [2.0.0] · 2018-11-28

[Diff](https://github.com/instrumentisto/ansible-coreos-bootstrap/compare/1.0.0...2.0.0)

#### BC Breaks

- Switch to [Python 3.5] in [PyPy] ([#3]).
- Move installation into `/opt/python/` directory by default ([#3]).
- Require `min_ansible_version: 2.5` ([#3]).

#### Added

- Configurable installation directory via `ansible_python_dir` variable ([#3]).

#### Changed

- Separate installation checks for [PyPy] and [pip] ([#3]).

#### Fixed

- Idempotency of `need_python` detection ([#1]).

[#1]: https://github.com/instrumentisto/ansible-coreos-bootstrap/pull/1
[#3]: https://github.com/instrumentisto/ansible-coreos-bootstrap/pull/3




## [1.0.0] · 2018-08-21

[Diff](https://github.com/instrumentisto/ansible-coreos-bootstrap/compare/forked...1.0.0)

#### Changed

- Switch to [portable PyPy] and upgrade [PyPy] to [6.0.0](http://doc.pypy.org/en/latest/release-v6.0.0.html) version ([85d50cc](https://github.com/instrumentisto/ansible-coreos-bootstrap/commit/85d50cc96616506ae57173b1adbbee09d7f2dd29)).

#### Fixed

- Update syntax to omit warnings from new [Ansible] versions ([a791c2c](https://github.com/instrumentisto/ansible-coreos-bootstrap/commit/a791c2c5705a5d1a30ec503907f938b6bc221d3a)).





[3.0.0]: https://github.com/instrumentisto/ansible-coreos-bootstrap/tree/3.0.0
[2.1.0]: https://github.com/instrumentisto/ansible-coreos-bootstrap/tree/2.1.0
[2.0.0]: https://github.com/instrumentisto/ansible-coreos-bootstrap/tree/2.0.0
[1.0.0]: https://github.com/instrumentisto/ansible-coreos-bootstrap/tree/1.0.0

[Ansible]: https://www.ansible.com
[Container Linux CoreOS]: https://coreos.com/os/docs/latest
[Fedora CoreOS]: https://getfedora.org/en/coreos
[pip]: https://pypi.org/project/pip
[portable PyPy]: https://github.com/squeaky-pl/portable-pypy
[PyPy]: https://pypy.org
[Python 3.5]: https://www.python.org/downloads/release/python-350
[Python 3.6]: https://www.python.org/downloads/release/python-360
[PyPy 7.2.0]: http://doc.pypy.org/en/latest/release-v7.2.0.html
[PyPy 7.3.2]: http://doc.pypy.org/en/latest/release-v7.3.2.html
[Semantic Versioning 2.0.0]: https://semver.org
