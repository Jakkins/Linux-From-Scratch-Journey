
# su - lfs
# source .bash_profile

# linux-5.5.3.tar.xz
#Glibc-2.31 

cd $LFS/sources

echo "Linux 5.5.3"
tar -xf linux-5.5.3.tar.xz
cd linux-5.5.3
make mrproper
make headers
cp -rv usr/include/* /tools/include
cd $LFS/sources

echo "5.5 Glibc-2.31"
tar -xf glibc-2.31.tar.xz
cd glibc-2.31
mkdir -v build
cd build
../configure                             \
      --prefix=/tools                    \
      --host=$LFS_TGT                    \
      --build=$(../scripts/config.guess) \
      --enable-kernel=3.2                \
      --with-headers=/tools/include
make
make install