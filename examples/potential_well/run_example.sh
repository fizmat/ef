LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:../../lib/petsc/debug/lib
export LD_LIBRARY_PATH

../../ef.out pot.conf
python3 plot.py
