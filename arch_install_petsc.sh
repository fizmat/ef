# Install PETSc

EFDIR=$PWD
mkdir petsc
mkdir petsc/opt

### get source
#git clone -b maint https://bitbucket.org/petsc/petsc petsc
wget http://ftp.mcs.anl.gov/pub/petsc/release-snapshots/petsc-lite-3.4.5.tar.gz

tar -xvzf petsc-lite-3.4.5.tar.gz
cd petsc-3.4.5

### compile production-version
PETSC_FLAGS="--with-cc=mpicc --with-cxx=mpic++ --with-fc=0 --with-clanguage=cxx"
sed -i '1 s/python/python2' ./configure
./configure ${PETSC_FLAGS} --prefix=${EFDIR}/petsc/opt --with-debugging=0
make PETSC_DIR=${EFDIR}/petsc-3.4.5 PETSC_ARCH=arch-linux2-cxx-opt all
make PETSC_DIR=${EFDIR}/petsc-3.4.5 PETSC_ARCH=arch-linux2-cxx-opt test
make install DESTDIR=${EFDIR}/petsc/opt
cd ../
rm -rf petsc-3.4.5
rm petsc-lite-3.4.5.tar.gz
