srcdir = .


prefix = /home/aav/specter/buildroot-2013.08/output/host/usr
exec_prefix = ${prefix}
bindir = ${exec_prefix}/bin
mandir = ${datarootdir}/man
datarootdir = ${prefix}/share
installcmd = /usr/bin/install -c

AR = /usr/bin/ar
CC = /usr/bin/gcc
CFLAGS = -O2 -I/home/aav/specter/buildroot-2013.08/output/host/usr/include -Wall -W
CPPFLAGS = -DHAVE_CONFIG_H -I/home/aav/specter/buildroot-2013.08/output/host/usr/include -I$(srcdir)/zlib -I. -I$(srcdir)
LDFLAGS = -L/home/aav/specter/buildroot-2013.08/output/host/lib -L/home/aav/specter/buildroot-2013.08/output/host/usr/lib -Wl,-rpath,/home/aav/specter/buildroot-2013.08/output/host/usr/lib
EXEEXT = 
RANLIB = ranlib

libs = -Lzlib -lm  -lz

base_sources = \
    ccache.c mdfour.c hash.c execute.c util.c args.c stats.c version.c \
    cleanup.c snprintf.c unify.c manifest.c hashtable.c hashtable_itr.c \
    murmurhashneutral2.c hashutil.c getopt_long.c exitfn.c lockfile.c \
    counters.c language.c compopt.c
base_objs = $(base_sources:.c=.o)

ccache_sources = main.c $(base_sources)
ccache_objs = $(ccache_sources:.c=.o)

zlib_sources = \
    zlib/adler32.c zlib/compress.c zlib/crc32.c zlib/deflate.c zlib/gzio.c \
    zlib/inffast.c zlib/inflate.c zlib/inftrees.c zlib/trees.c zlib/zutil.c
zlib_objs = $(zlib_sources:.c=.o)

test_suites =  ./test/test_args.c ./test/test_argument_processing.c ./test/test_compopt.c ./test/test_counters.c ./test/test_hash.c ./test/test_hashutil.c ./test/test_lockfile.c ./test/test_stats.c ./test/test_util.c
test_sources = test/main.c test/framework.c test/util.c $(test_suites)
test_objs = $(test_sources:.c=.o)

all_sources = $(ccache_sources) $(test_sources)
all_objs = $(ccache_objs) $(test_objs) $(zlib_objs)

files_to_clean = $(all_objs) ccache$(EXEEXT) test/main$(EXEEXT) *~
files_to_distclean = Makefile config.h config.log config.status

.PHONY: all
all: ccache$(EXEEXT)

ccache$(EXEEXT): $(ccache_objs) zlib/libz.a
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $(ccache_objs) $(libs)

.PHONY: install
install: all
	$(installcmd) -d $(DESTDIR)$(bindir)
	$(installcmd) -m 755 ccache$(EXEEXT) $(DESTDIR)$(bindir)
	$(installcmd) -d $(DESTDIR)$(mandir)/man1
	-$(installcmd) -m 644 $(srcdir)/ccache.1 $(DESTDIR)$(mandir)/man1/

.PHONY: clean
clean:
	rm -f $(files_to_clean)

zlib/libz.a: $(zlib_objs)
	$(AR) cr $@ $(zlib_objs)
	$(RANLIB) $@

.PHONY: perf
perf: ccache$(EXEEXT)
	$(srcdir)/perf.py --ccache ccache$(EXEEXT) $(CC) $(CFLAGS) $(CPPFLAGS) $(srcdir)/ccache.c

.PHONY: test
test: ccache$(EXEEXT) test/main$(EXEEXT)
	test/main$(EXEEXT)
	CC='$(CC)' $(srcdir)/test.sh

.PHONY: quicktest
quicktest: test/main$(EXEEXT)
	test/main$(EXEEXT)

test/main$(EXEEXT): $(base_objs) $(test_objs) zlib/libz.a
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $(base_objs) $(test_objs) $(libs)

test/main.o: test/suites.h

test/suites.h: $(test_suites) Makefile
	sed -n 's/TEST_SUITE(\(.*\))/SUITE(\1)/p' $(test_suites) >$@

.PHONY: check
check: test

.PHONY: distclean
distclean: clean
	rm -rf $(files_to_distclean)

.PHONY: installcheck
installcheck: ccache$(EXEEXT) test/main$(EXEEXT)
	test/main$(EXEEXT)
	CCACHE=$(bindir)/ccache CC='$(CC)' $(srcdir)/test.sh

.c.o:
	$(CC) $(CFLAGS) $(CPPFLAGS) -c -o $@ $<


