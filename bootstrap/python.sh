#!/bin/bash
# Select current version of virtualenv:
VERSION=1.9.1
# Name your first "bootstrap" environment:
INITIAL_ENV=~/.venv_bootstrap
# Options for your first environment:
ENV_OPTS='--no-site-packages --distribute'
# Set to whatever python interpreter you want for your first environment:
PYTHON=$(which python)
URL_BASE=https://pypi.python.org/packages/source/v/virtualenv

# --- Real work starts here ---

echo "[1/5] Grabbing virtualenv $VERSION"
    curl -O $URL_BASE/virtualenv-$VERSION.tar.gz
    tar xzf virtualenv-$VERSION.tar.gz

# Create the first "bootstrap" environment.
echo "[2/5] Creating new virtualenv in $INITIAL_ENV"
    if [ ! -f $INITIAL_ENV ]; then
        mkdir -p $INITIAL_ENV
    fi
    $PYTHON virtualenv-$VERSION/virtualenv.py $ENV_OPTS $INITIAL_ENV

echo "[3/5] Installing virtualenv/wrapper package to $INITIAL_ENV"
# Install virtualenv into the environment.
    $INITIAL_ENV/bin/pip install virtualenv-$VERSION.tar.gz
    $INITIAL_ENV/bin/pip install virtualenvwrapper

echo "[4/5] Installing default pip packages"
    $INITIAL_ENV/bin/pip install -r pip_freeze.txt

echo "[5/5] Cleaning up"
# Don't need this anymore.
    rm -rf virtualenv-$VERSION*

echo "Don't forget to add $INITIAL_ENV/bin to your PATH"
