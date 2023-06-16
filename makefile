ICEFILE = $(wildcard *.ice)

gen : 
	slice2cpp $(ICEFILE)

# clean :
# 	rm *.cpp *.h