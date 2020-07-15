#!/bin/sh
time { ../sources/binutils-2.34/configure		\
				--prefix=/lfs/tools 			\
				--with-sysroot=/lfs				\
				--with-lib-path=/lfs/tools/lib 	\
				--target=$LFS_TGT          		\
				--disable-nls              		\
				--disable-werror				\
 && make && make install; }
