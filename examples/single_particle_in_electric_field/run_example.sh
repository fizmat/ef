LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:../../lib/petsc/opt/lib
export LD_LIBRARY_PATH

../../ef.out single_particle_in_electric_field.conf
python3 plot_potential.py
python3 plot_trajectory.py
