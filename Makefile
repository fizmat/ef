### Allows better regexp support.
SHELL:=/bin/bash -O extglob

##### Compilers
##### Prll
#export OMPI_CXX=clang++
CC = mpic++
HDF5FLAGS=-I/usr/include/hdf5/openmpi -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_BSD_SOURCE
PETSCFLAGS=-isystem /usr/include/petsc
SUPPRESS_MPI_C11_WARNING=-Wno-literal-suffix
CFLAGS = ${HDF5FLAGS} ${PETSCFLAGS} -O3 -std=c++11 ${SUPPRESS_MPI_C11_WARNING}
LDFLAGS = 

### Libraries
COMMONLIBS=-lm
BOOSTLIBS=-lboost_program_options
PETSCLIBS=-lpetsc
HDF5LIBS=-L/usr/lib/x86_64-linux-gnu/hdf5/openmpi -lhdf5_hl -lhdf5 -Wl,-z,relro -lpthread -lz -ldl -lm -Wl,-rpath -Wl,/usr/lib/x86_64-linux-gnu/hdf5/openmpi
LIBS=${COMMONLIBS} ${BOOSTLIBS} ${PETSCLIBS} ${HDF5LIBS}

### Sources and executable
CPPSOURCES=$(wildcard *.cpp)
CPPHEADERS=$(wildcard *.h)
OBJECTS=$(CPPSOURCES:%.cpp=%.o)
EXECUTABLE=ef.out
MAKE=make
TINYEXPR=./lib/tinyexpr
TINYEXPR_OBJ=./lib/tinyexpr/tinyexpr.o
SUBDIRS=doc

$(EXECUTABLE): $(OBJECTS) $(TINYEXPR)
	$(CC) $(LDFLAGS) $(OBJECTS) $(TINYEXPR_OBJ) -o $@ $(LIBS)

$(OBJECTS):%.o:%.cpp $(CPPHEADERS)
	$(CC) $(CFLAGS) -c $< -o $@

.PHONY: allsubdirs $(SUBDIRS) $(TINYEXPR) clean cleansubdirs cleanall

allsubdirs: $(SUBDIRS)

$(TINYEXPR):
	$(MAKE) -C $@

$(SUBDIRS):
	$(MAKE) -C $@

all: $(EXECUTABLE) doc

clean: cleansublibs
	rm -f *.o *.out *.mod *.zip

cleansublibs:
	for X in $(TINYEXPR); do $(MAKE) clean -C $$X; done 

cleansubdirs:
	for X in $(SUBDIRS); do $(MAKE) clean -C $$X; done 

cleanall: clean cleansubdirs

