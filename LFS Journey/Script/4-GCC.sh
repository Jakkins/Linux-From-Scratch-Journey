
echo "enter with lfs user"
cd $LFS/sources

echo "5.3 GCC-9.2.0 - Pass 1"
tar -Jxf gcc-9.2.0.tar.xz
cd gcc-9.2.0

tar -xf ../mpfr-4.0.2.tar.xz
mv -v mpfr-4.0.2 mpfr
tar -xf ../gmp-6.2.0.tar.xz
mv -v gmp-6.2.0 gmp
tar -xf ../mpc-1.1.0.tar.gz
mv -v mpc-1.1.0 mpc

for file in gcc/config/{linux,i386/linux{,64}}.h
do
  cp -uv $file{,.orig}
  sed -e 's@/lib\(64\)\?\(32\)\?/ld@/tools&@g' \
      -e 's@/usr@/tools@g' $file.orig > $file
  echo '
#undef STANDARD_STARTFILE_PREFIX_1
#undef STANDARD_STARTFILE_PREFIX_2
#define STANDARD_STARTFILE_PREFIX_1 "/tools/lib/"
#define STANDARD_STARTFILE_PREFIX_2 ""' >> $file
  touch $file.orig
done

case $(uname -m) in
 x86_64)
    sed -e '/m64=/s/lib64/lib/' -i.orig gcc/config/i386/t-linux64
 ;;
esac

mkdir -v build

cd build
../configure                        \
    --target=$LFS_TGT               \
    --prefix=$LFS/tools             \
    --with-glibc-version=2.11       \
    --with-sysroot=$LFS             \
    --with-newlib                   \
    --without-headers               \
    --enable-initfini-array         \
    --disable-nls                   \
    --disable-shared                \
    --disable-multilib              \
    --disable-decimal-float         \
    --disable-threads               \
    --disable-libatomic             \
    --disable-libgomp               \
    --disable-libquadmath           \
    --disable-libssp                \
    --disable-libvtv                \
    --disable-libstdcxx             \
    --enable-languages=c,c++
make && make install
cd $LFS/sources




# Raspberry thing
# cd ..
# cat gcc/limitx.h gcc/glimits.h gcc/limity.h > \
#     `dirname $($LFS_TGT-gcc -print-libgcc-file-name)`/install-tools/include/limits.h
# cd $LFS/sources
# rm -rf gcc-10.1.0