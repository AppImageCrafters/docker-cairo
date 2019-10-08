#! /bin/bash

set -xe

source /entrypoint.sh

wget https://www.cairographics.org/snapshots/cairo-"$CAIRO_VERSION".tar.xz -O- | tar xJ

cd cairo-"$CAIRO_VERSION"

export CHOST="$DEBARCH"
export CFLAGS="-I/deps/include"
export CPPFLAGS="$CFLAGS"
export LDFLAGS="-L/deps/lib"

./configure --prefix=/usr/local --target="$CHOST" --host="$CHOST" --enable-xlib=no

# build and install into prefix
make all -j$(nproc)
make install

cd ..

rm -rf cairo-$CAIRO_VERSION/
