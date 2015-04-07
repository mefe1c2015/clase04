CPP = g++

INCL  = $(shell root-config --cflags)

LIBS  = $(shell root-config --libs) -lMinuit

SRCS = %Nombre del .cc a compilar%

OBJ = $(SRCS:.cc=.o)

EXE = %Nombre del ejecutable%

.PHONY: all depend clean

all: $(EXE)

$(EXE) : $(OBJ)
	@ echo
	@ echo "Linkeando..." 
	$(CPP) $^ -o $@ $(LIBS)
	@ echo "Listo!"
	

%.o : %.cc
	@ echo
	@ echo "Compilando..."
	$(CPP) -c $< -o $@ $(INCL)
	
depend: Make-depend

Make-depend:
	@ echo
	@ echo "Creando Make-depend..."
	@ touch $@
	- makedepend -f$@ -Y -- $(INCL) -- *.cc *.cxx > /dev/null 2>&1

clean:
	- rm -f *.o $(OBJ) *.so Make-depend $(EXE) 

include Make-depend

# DO NOT DELETE
