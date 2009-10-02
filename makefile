PIN_HOME ?= ../..
include $(PIN_HOME)/makefile.gnu.config
LINKER?=${CXX}
CXXFLAGS ?= -Wall -Werror -Wno-unknown-pragmas $(DBG) $(OPT)

CXX=/work/gcc-4.2.0/bin/g++-4.2.0

all: mica_v0-2

mica_all.o: mica.h mica_all.h mica_all.cpp
	$(CXX) -static -g -c $(CXXFLAGS) $(PIN_CXXFLAGS) mica_all.cpp -o mica_all.o

mica_init.o: mica.h mica_init.h mica_init.cpp
	$(CXX) -static -g -c $(CXXFLAGS) $(PIN_CXXFLAGS) mica_init.cpp -o mica_init.o

mica_utils.o: mica.h mica_utils.h mica_utils.cpp
	$(CXX) -static -g -c $(CXXFLAGS) $(PIN_CXXFLAGS) mica_utils.cpp -o mica_utils.o

mica_ilp.o: mica.h mica_ilp.h mica_ilp.cpp 
	$(CXX) -static -g -c $(CXXFLAGS) $(PIN_CXXFLAGS) mica_ilp.cpp -o mica_ilp.o

mica_itypes.o: mica.h mica_itypes.h mica_itypes.cpp
	$(CXX) -static -g -c $(CXXFLAGS) $(PIN_CXXFLAGS) mica_itypes.cpp -o mica_itypes.o

mica_ppm.o: mica.h mica_ppm.h mica_ppm.cpp
	$(CXX) -static -g -c $(CXXFLAGS) $(PIN_CXXFLAGS) mica_ppm.cpp -o mica_ppm.o

mica_reg.o: mica.h mica_reg.h mica_reg.cpp
	$(CXX) -static -g -c $(CXXFLAGS) $(PIN_CXXFLAGS) mica_reg.cpp -o mica_reg.o

mica_stride.o: mica.h mica_stride.h mica_stride.cpp
	$(CXX) -static -g -c $(CXXFLAGS) $(PIN_CXXFLAGS) mica_stride.cpp -o mica_stride.o

mica_memfootprint.o: mica.h mica_memfootprint.h mica_memfootprint.cpp
	$(CXX) -static -g -c $(CXXFLAGS) $(PIN_CXXFLAGS) mica_memfootprint.cpp -o mica_memfootprint.o

mica_memreusedist.o: mica.h mica_memreusedist.h mica_memreusedist.cpp
	$(CXX) -static -g -c $(CXXFLAGS) $(PIN_CXXFLAGS) mica_memreusedist.cpp -o mica_memreusedist.o

mica_v0-2.o: mica.h mica_v0-2.cpp
	$(CXX) -static -g -c $(CXXFLAGS) $(PIN_CXXFLAGS) mica_v0-2.cpp -o mica_v0-2.o

mica_v0-2: mica.h mica_v0-2.o mica_all.o mica_init.o mica_utils.o mica_ilp.o mica_itypes.o mica_ppm.o mica_reg.o mica_stride.o mica_memfootprint.o mica_memreusedist.o
	$(CXX) -g -static $(PIN_LDFLAGS) $(LINK_DEBUG) mica_v0-2.o mica_all.o mica_init.o mica_utils.o mica_ilp.o mica_itypes.o mica_ppm.o mica_reg.o mica_stride.o mica_memfootprint.o mica_memreusedist.o -o mica_v0-2 $(PIN_LPATHS) $(PIN_LIBS) $(DBG)


clean: 
	rm -f *.o mica_v0-2 *pin*out mica*log*