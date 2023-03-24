ICEFILE = AuthModule.ice EventDataModule.ice

gen : 
	slice2cpp $(ICEFILE)

clean :
	rm *.cpp *.h