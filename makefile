# compilation flags
CC = g++

SLICEFLAGS = -I./slice --output-dir $(COMMDIR)

# Generated files directory
COMMDIR = comm

# Ice files
ICEFILE = $(wildcard slice/*.ice)

# get slice file names without the slice/ directory
ICEFILENODIR = $(notdir $(ICEFILE))

# create naming for .cpp and .h files
CPPFILES = $(ICEFILENODIR:.ice=.cpp)
HFILES = $(ICEFILENODIR:.ice=.h)

# add COMMDIR to generated files
CPPFILES := $(addprefix $(COMMDIR)/, $(CPPFILES)) 
HFILES := $(addprefix $(COMMDIR)/, $(HFILES))

# target that depends on all generated and object files
all: $(CPPFILES) 
	
# rule to generate output files for each .ice file
$(COMMDIR)/%.cpp $(COMMDIR)/%.h: ./slice/%.ice | gen_dirs
	slice2cpp $(SLICEFLAGS) $<

.PHONY: gen_dirs
gen_dirs:
	mkdir -p $(COMMDIR)

# clean target
clean:
	rm -rf $(COMMDIR) $(OBJDIR)

echo:
	@echo $(ICEFILENODIR)
	@echo $(ICEFILE)
	@echo $(CPPFILES)
	@echo $(HFILES)
	@echo $(OBJFILE)
	@echo $(UTILSFILE)