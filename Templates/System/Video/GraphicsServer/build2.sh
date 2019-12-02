# Source -> http://wayland.freedesktop.org/building.html

# Env
# ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~
export WLD=$HOME/Projects/KendoLinux/release/System/Graphics
export LD_LIBRARY_PATH=$WLD/lib
export PKG_CONFIG_PATH=$WLD/lib/pkgconfig/:$WLD/share/pkgconfig/
export PATH=$WLD/bin:$PATH
export ACLOCAL_PATH=$WLD/share/aclocal
export ACLOCAL="aclocal -I $ACLOCAL_PATH"
mkdir -p $WLD/share/aclocal

# Wayland libraries
# ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~
git clone git://anongit.freedesktop.org/wayland/wayland
cd wayland
./autogen.sh --prefix=$WLD --disable-documentation --disable-libunwind
make && make install
cd ..

# Mesa, Deps[yaourt mako glproto dri2proto dri3proto presentproto llvm]
# ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~
git clone git://anongit.freedesktop.org/mesa/mesa
cd mesa
./autogen.sh --prefix=$WLD --enable-gles2 --disable-gallium-egl \
  --with-egl-platforms=x11,wayland,drm --enable-gbm --enable-shared-glapi \
  --with-gallium-drivers=r300,r600,swrast,nouveau
make && make install
cd ..

# libunwind
# ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~
git clone git://git.sv.gnu.org/libunwind
cd libunwind
autoreconf -i
./configure --prefix=$WLD
make && make install
cd ..

# libinput
# ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~
git clone git://anongit.freedesktop.org/wayland/libinput
cd libinput
./autogen.sh --prefix=$WLD
make && make install
cd ..

# applications
# ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~
git clone git://anongit.freedesktop.org/wayland/weston
cd weston
./autogen.sh --prefix=$WLD
make
sudo make install
cd ..

# libepoxy, Deps[yaourt xorg-util-macros]
# ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~
git clone https://github.com/anholt/libepoxy.git
cd libepoxy
./autogen.sh --prefix=$WLD
make && make install
cd ..

# X, Deps[yaourt xtrans, xcmiscproto, bigreqsproto, resourceproto, xf86driproto]
# ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~
git clone git://anongit.freedesktop.org/xorg/xserver
cd xserver
./autogen.sh --prefix=$WLD --disable-docs --disable-devel-docs \
  --enable-xwayland --disable-xorg --disable-xvfb --disable-xnest \
  --disable-xquartz --disable-xwin
make && make install
cd ..

# 
# ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~
mkdir -p $WLD/share/X11/xkb/rules
ln -s /usr/share/X11/xkb/rules/evdev $WLD/share/X11/xkb/rules/
ln -s /usr/bin/xkbcomp $WLD/bin/

