# Compiler settings
FC = gfortran
FCFLAGS = -fPIC

# Source files
SOURCES = mymodule.f90 dependencies.f90 main.f90

# Object files
OBJECTS = $(SOURCES:.f90=.o)

# Output files
LIBRARY = libfortranlib.so
EXECUTABLE = main

# Default target
all: $(LIBRARY) $(EXECUTABLE)

$(LIBRARY): $(OBJECTS)
	$(FC) -shared -o $@ $^

$(EXECUTABLE): $(OBJECTS)
	$(FC) -o $@ $^

%.o: %.f90
	$(FC) $(FCFLAGS) -c $< -o $@

clean:
	trash $(OBJECTS) $(LIBRARY) $(EXECUTABLE) *.mod
