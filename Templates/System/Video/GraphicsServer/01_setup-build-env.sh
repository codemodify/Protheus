#!/bin/bash

export WLD=$HOME/Projects/46et2/protheus/System/Video/GraphicsServer/build
export WLDINSTAL=$HOME/Projects/46et2/protheus/System/Video/GraphicsServer
export LD_LIBRARY_PATH=$WLD
export PKG_CONFIG_PATH=$WLD
export PATH=$WLD:$PATH
export ACLOCAL_PATH=$WLD
export ACLOCAL="aclocal -I $ACLOCAL_PATH"

mkdir $WLD
