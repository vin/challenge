
SRCS=$(wildcard *.hs)
OUTPUT=$(SRCS:.hs=)

.PHONY: all
all: $(OUTPUT)

%: %.hs
	ghc -O2 --make $@

.PHONY: clean
clean:
	$(RM) $(wildcard *.o *.hi $(OUTPUT))
