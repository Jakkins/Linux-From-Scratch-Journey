
echo "mkdir -v $LFS/tools as root"

# Crucial
echo "ln -sv $LFS/tools /"
echo "If you have /tool dir in your root you have to remove it"
echo ""
echo "groupadd lfs"
echo "useradd -s /bin/bash -g lfs -m -k /dev/null lfs"
echo "passwd lfs"
echo ""
echo "chown -v lfs $LFS/tools       recursive or not?"
echo "chown -v lfs $LFS/sources     recursive or not?"
echo "su - lfs"

cd /home/lfs

cat > ~/.bash_profile << "EOF"
exec env -i HOME=$HOME TERM=$TERM PS1='\u:\w\$ ' /bin/bash
EOF

cat > ~/.bashrc << "EOF"
set +h
umask 022
LFS=/mnt/lfs
LC_ALL=POSIX
LFS_TGT=$(uname -m)-lfs-linux-gnu
PATH=/tools/bin:/bin:/usr/bin
export LFS LC_ALL LFS_TGT PATH
EOF

source .bash_profile
echo $LFS