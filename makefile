# compilation flags
CXXFLAGS = -I./slice --output-dir $(GENDIR)

# Generated files directory
GENDIR = generated

# Ice files
ICEFILE = $(wildcard slice/*.ice)

# get slice file names without the slice/ directory
ICEFILENODIR = $(notdir $(ICEFILE))

# create naming for .cpp and .h files
CPPFILES = $(ICEFILENODIR:.ice=.cpp)
HFILES = $(ICEFILENODIR:.ice=.h)

# add GENDIR to generated files
CPPFILES := $(addprefix $(GENDIR)/, $(CPPFILES))
HFILES := $(addprefix $(GENDIR)/, $(HFILES))

# target that depends on all generated files
all: $(CPPFILES) $(HFILES)

# rule to generate output files for each .ice file
$(GENDIR)/%.cpp $(GENDIR)/%.h: ./slice/%.ice
	slice2cpp $(CXXFLAGS) $<

# clean target
clean:
	rm $(CPPFILES) $(HFILES)

echo:
	@echo $(ICEFILE)
	@echo $(ICEFILENODIR)
	@echo $(CPPFILES)
	@echo $(HFILES)