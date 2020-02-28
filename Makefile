CPP = g++
PROJ = Quad_euler
DEPS = $(PROJ).cpp
USERDIR = ./user
LIBDIR = ./src

# Prefer static libs to dynamic
LIBS = -Wl,-Bstatic \
	  	 -Wl,-Bdynamic
#	  -lrt -Wl,-Bdynamic
 
CFLAGS = -I/usr/include/eigen3/Eigen/ -I/usr/lib/x86_64-linux-gnu/ -I$(USERDIR) -I$(LIBDIR)
# CFLAGS = -I"C:\c_libraries\eigen-eigen-dc6cfdf9bcec" -I"C:\c_libraries\boost_1_61_0" -I$(USERDIR) -I$(LIBDIR)

# Default code optimization level
OPT = -O2

all: $(PROJ)

# Debug build with extra warning turned on and optimization off
debug: OPT = -O0 -g -m64
debug: CFLAGS += -Wall -Wextra
debug: $(PROJ)

$(PROJ): $(DEPS)
	$(CPP) $(CFLAGS) $^ -o $@ $(OPT) $(LIBS)

clean:
	rm -f *.o $(PROJ)
