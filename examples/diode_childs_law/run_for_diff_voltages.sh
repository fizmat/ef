LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:../../lib/petsc/opt/lib
export LD_LIBRARY_PATH

for x in V*.conf
do
    ../../ef.out $x
done
