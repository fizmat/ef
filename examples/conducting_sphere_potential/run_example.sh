LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:../../lib/petsc/opt/lib
export LD_LIBRARY_PATH
../../ef.out conducting_sphere_potential.conf
python3 plot.py
