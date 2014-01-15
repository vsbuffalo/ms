CC=clang
CFLAGS=-g -O0 
LIBS=-lm
RAND=rand1.c
RANDO=$(addsuffix .o, $(basename $(RAND)))

.PHONY: clean all 

ms.o: ms.c ms.h
	$(CC) $(CFLAGS) -c $<

streec.o: streec.c ms.h
	$(CC) $(CFLAGS) -c $<

$(RANDO): $(RAND)
	$(CC) $(CFLAGS) -c $<

ms: ms.o streec.o $(RANDO)
	$(CC) $(CFLAGS) -o $@ $^ $(LIBS) 

stats: stats.c
	$(CC) $(CFLAGS) $(LIBS) -o $@ $<

sample_stats: sample_stats.c
	$(CC) $(CFLAGS) $(LIBS) -o $@ $<

all: ms stats sample_stats

clean: 
	rm -f ms stats sample_stats
