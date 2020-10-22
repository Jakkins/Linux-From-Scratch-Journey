
echo "enter with lfs user"
cd $LFS/sources

echo "5.2 Binutils-2.34 Pass 1"
tar -Jxf binutils-2.34.tar.xz
cd binutils-2.34
mkdir -v build
cd build
../configure --prefix=$LFS/tools \
             --with-sysroot=$LFS \
             --target=$LFS_TGT   \
             --disable-nls       \
             --disable-werror
make

case $(uname -m) in
  x86_64) mkdir -v /tools/lib && ln -sv lib /tools/lib64 ;;
esac

make install
cd $LFS/sources

