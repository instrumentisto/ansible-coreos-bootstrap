#/bin/bash

set -e

if [ -d /opt/python ]; then
  # let's clear any old install
  rm /opt/python -rf
fi

mkdir -p /opt/python
cd /opt/python

if [[ -e /opt/python/pypy$PYTHON_VERSION-$PYPY_VERSION-linux_x86_64-portable.tar.bz2 ]]; then
  tar -xjf /opt/python/pypy$PYTHON_VERSION-$PYPY_VERSION-linux_x86_64-portable.tar.bz2
  rm -rf /opt/python/pypy$PYTHON_VERSION-$PYPY_VERSION-linux_x86_64-portable.tar.bz2
else
  wget -O - https://bitbucket.org/squeaky/portable-pypy/downloads/pypy$PYTHON_VERSION-$PYPY_VERSION-linux_x86_64-portable.tar.bz2 |tar -xjf -
fi

mv -n pypy$PYTHON_VERSION-$PYPY_VERSION-linux_x86_64-portable pypy


mkdir -p /opt/python/bin/

cat > /opt/python/bin/python <<EOF
#!/bin/bash
LD_LIBRARY_PATH=/opt/python/pypy/lib:$LD_LIBRARY_PATH exec /opt/python/pypy/bin/pypy "\$@"
EOF

chmod +x /opt/python/bin/python
/opt/python/bin/python --version
