LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:../../lib/petsc/debug/lib
export LD_LIBRARY_PATH

../../ef.out single_particle_in_free_space.conf
python3 plot.py
