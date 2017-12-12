LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:../../lib/petsc/debug/lib
export LD_LIBRARY_PATH

../../ef.out contour.conf
python3 beam_contour.py
