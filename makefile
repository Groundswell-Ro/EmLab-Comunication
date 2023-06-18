
# output dir
OUTDIR = generated

# Ice files
ICEFILE = $(wildcard *.ice)

# generated .h .cpp files
CPPFILES = $(ICEFILE:.ice=.cpp)
HFILES = $(ICEFILE:.ice=.h)
# add outdir to generated files
CPPFILES := $(addprefix $(OUTDIR)/, $(CPPFILES))
HFILES := $(addprefix $(OUTDIR)/, $(HFILES))

CXXFLAGS = -I. --output-dir $(OUTDIR)

all : 
	slice2cpp $(CXXFLAGS) $(ICEFILE)

clean :
	rm $(CPPFILES) $(HFILES)

echo:
	@echo $(ICEFILE)
	@echo $(CPPFILES)
	@echo $(HFILES)

