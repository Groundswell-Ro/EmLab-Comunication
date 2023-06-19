# compilation flags
CC = g++

SLICEFLAGS = -I./slice --output-dir $(COMMDIR)
CXXFLAGS = -std=c++14 -I. -I./$(COMMDIR) -DICE_CPP11_MAPPING

# Generated files directory
COMMDIR = comm
UTILSDIR = utils
OBJDIR = obj

# Ice files
ICEFILE = $(wildcard slice/*.ice)
UTILSFILE = $(wildcard $(UTILSDIR)/*.cpp)

# get slice file names without the slice/ directory
ICEFILENODIR = $(notdir $(ICEFILE))
UTILSNODIR = $(notdir $(UTILSFILE))

# create naming for .cpp and .h files
CPPFILES = $(ICEFILENODIR:.ice=.cpp)
HFILES = $(ICEFILENODIR:.ice=.h)
OBJFILE = $(ICEFILENODIR:.ice=.o) $(UTILSNODIR:.cpp=.o) 

# add COMMDIR to generated files
CPPFILES := $(addprefix $(COMMDIR)/, $(CPPFILES)) 
HFILES := $(addprefix $(COMMDIR)/, $(HFILES))
OBJFILE := $(addprefix $(OBJDIR)/, $(OBJFILE)) 

# target that depends on all generated and object files
all: $(CPPFILES) $(OBJFILE)
	
# rule to compile .cpp files into .o files
$(OBJDIR)/%.o: $(COMMDIR)/%.cpp $(COMMDIR)/%.h | gen_dirs
	$(CC) -c $(CXXFLAGS) -o $@ $<

${OBJDIR}/%.o: ${UTILSDIR}/%.cpp ${UTILSDIR}/%.h | gen_dirs
	$(CC) -c $(CXXFLAGS) -o $@ $<

# rule to generate output files for each .ice file
$(COMMDIR)/%.cpp $(COMMDIR)/%.h: ./slice/%.ice | gen_dirs
	slice2cpp $(SLICEFLAGS) $<

.PHONY: gen_dirs
gen_dirs:
	mkdir -p $(COMMDIR)
	mkdir -p $(OBJDIR)

# clean target
clean:
	rm $(CPPFILES) $(HFILES) $(OBJFILE)

echo:
	@echo $(ICEFILENODIR)
	@echo $(ICEFILE)
	@echo $(CPPFILES)
	@echo $(HFILES)
	@echo $(OBJFILE)
	@echo $(UTILSFILE)