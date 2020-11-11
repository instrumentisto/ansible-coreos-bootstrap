#/bin/bash

set -e


if [[ -d "$PYTHON_DIR" ]]; then
  rm -rf "$PYTHON_DIR"
fi
mkdir -p "$PYTHON_DIR/pypy/"
cd "$PYTHON_DIR"

pypyUrl=${PYPY_OVERRIDE_DOWNLOAD_URL:-"https://downloads.python.org/pypy/pypy$PYTHON_VERSION-v$PYPY_VERSION-linux64.tar.bz2"}
curl -L "$pypyUrl" | tar -C pypy --strip-components 1 -xjf -

mkdir -p "$PYTHON_DIR/bin/"

cat > "$PYTHON_DIR/bin/python" <<EOF
#!/bin/bash
LD_LIBRARY_PATH=$PYTHON_DIR/pypy/lib:$LD_LIBRARY_PATH exec $PYTHON_DIR/pypy/bin/pypy "\$@"
EOF

chmod +x "$PYTHON_DIR/bin/python"
"$PYTHON_DIR/bin/python" --version


touch "$PYTHON_DIR/.bootstrapped_${PYTHON_VERSION}_$PYPY_VERSION"
