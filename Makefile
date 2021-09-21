ATSFLAGS := -DGNU_SOURCE -DATS_MEMALLOC_LIBC -cleanaft -flto -O3 -latslib

all: read_line_stream read_line_scanf read_ints randoms_in_range

randoms_in_range: randoms_in_range.dats
	acc pc ${ATSFLAGS} -o $@ $<

read_ints: read_ints.dats
	acc pc ${ATSFLAGS} -o $@ $<

read_line_scanf: read_line_scanf.dats
	acc pc ${ATSFLAGS} -o $@ $<

read_line_stream: read_line_stream.dats
	acc pc ${ATSFLAGS} -o $@ $<

%_sats.o: %.sats
	acc pc -c $< || touch $@

%_dat.o: %.dats
	acc pc -DATS_MEMALLOC_LIBC -c $< || touch $@

clean:
	rm -f *.o *_?ats.c read_line_stream read_line_scanf read_ints randoms_in_range