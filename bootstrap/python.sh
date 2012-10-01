#!/bin/bash
# Select current version of virtualenv:
VERSION=1.6.4
# Name your first "bootstrap" environment:
INITIAL_ENV=~/.local
# Options for your first environment:
ENV_OPTS='--no-site-packages --distribute'
# Set to whatever python interpreter you want for your first environment:
PYTHON=$(which python)
    URL_BASE=http://pypi.python.org/packages/source/v/virtualenv

# --- Real work starts here ---

echo "[1/4] Grabbing virtualenv $VERSION"
    curl -O $URL_BASE/virtualenv-$VERSION.tar.gz
    tar xzf virtualenv-$VERSION.tar.gz
# Create the first "bootstrap" environment.

echo "[2/4] Creating new virtualenv in $INITIAL_ENV"
    if [ ! -f $INITIAL_ENV ]; then
        mkdir -p $INITIAL_ENV
    fi
    $PYTHON virtualenv-$VERSION/virtualenv.py $ENV_OPTS $INITIAL_ENV

echo "[3/4] Installing virtualenv package to $INITIAL_ENV"
# Install virtualenv into the environment.
    $INITIAL_ENV/bin/pip install virtualenv-$VERSION.tar.gz

echo "[4/4] Cleaning up"
# Don't need this anymore.
    rm -rf virtualenv-$VERSION*
