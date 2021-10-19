

# TODO: Fill most of this in
# Some parts have been filled in for you

ASM :=
ASM_FLAGS :=

#
CC :=
CC_FLAGS:=

#
CPP :=
CPP_FLAGS :=

#
LINKER :=
LINKER_FLAGS :=

# Your executable must be named my-program
BIN_NAME := my-program
BIN := ./$(BIN_NAME)


# For this assignment, we're going to create an individual Makefile target for each source file.
# Don't alter the structure of the Makefile; Just fill it in.


# Filled in for you
default:	run


# Filled in for you
clean:
	-rm *.o
	-rm $(BIN)
.PHONY: clean


# Filled in for you
run:	build
	@echo
	@echo "Running: $(BIN)"
	$(BIN)
.PHONY: run


# Filled in for you
debug:	build
	@echo
	@echo "Debugging: $(BIN)"
	gdb $(BIN) -x gdb-commands.txt
.PHONY: debug


# Filled in for you
build:	$(BIN)
	@echo "Done building"
.PHONY: build



# The rest of this needs to be filled in


# TODO: Fill this in
$(BIN):
	@echo
	@echo "Linking: $@"


# TODO: Fill this in
largest.o:
	@echo
	@echo "Building: $@"


# TODO: Fill this in
manager.o:
	@echo
	@echo "Building: $@"


# TODO: Fill this in
input_array.o:
	@echo
	@echo "Building: $@"


# TODO: Fill this in
output_array.o:
	@echo
	@echo "Building: $@"


# TODO: Fill this in
find_largest.o:
	@echo
	@echo "Building: $@"





