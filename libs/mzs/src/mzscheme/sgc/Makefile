#
# Makefile for SenoraGC
#

srcdir = .

CC = gcc
CXX = g++
RANLIB = ranlib
AR = ar
ARFLAGS = ruv

CFLAGS = -g -O2   -Wall  

OBJS =  sgc.o

SRCS =  $(srcdir)/sgc.c

../libmzgc.a: $(OBJS)
	$(MAKE) gcobjects
	$(AR) $(ARFLAGS) ../libmzgc.a $(OBJS)
	$(RANLIB) ../libmzgc.a

test: $(OBJS) test.o
	$(CC) -o test $(OBJS) test.o

gcobjects: $(OBJS)

sgc.o: $(srcdir)/sgc.c $(srcdir)/autostat.inc $(srcdir)/collect.inc $(srcdir)/../utils/splay.c
	$(CC) $(CFLAGS) -I.. -c $(srcdir)/sgc.c -o sgc.o

test.o: $(srcdir)/test.c
	$(CC) $(CFLAGS) -c $(srcdir)/test.c -o test.o

clean:
	/bin/rm -f $(OBJS) gc.a test

# Extra dependencies

sgc.o: $(srcdir)/sgc.h

test.o: $(srcdir)/sgc.h
