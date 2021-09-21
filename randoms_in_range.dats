#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

staload STDLIB = "libats/libc/SATS/stdlib.sats"
staload UN = "prelude/SATS/unsafe.sats"
staload TIME = "libats/libc/SATS/time.sats"

fun next_int_in_range
  (lower: int, upper: int): int = 
  let
    val () = assertloc(lower >= 0 andalso upper >= 0 andalso lower <= upper)
    val range = $UN.cast{lint}(upper - lower + 1)
    val random = $STDLIB.lrand48() mod range + $UN.cast{lint}(lower)
  in
    $UN.cast{int}(random)
  end

fun test_in_range_inclusive
  (lower, upper): void = 
  let
    val () = $STDLIB.srand48($UN.cast{lint}($TIME.time_get()))

    fun loop(iter: int, limit: int): void = 
      if iter < limit then let
        val random = next_int_in_range(lower, upper)
      in
        (
          assertloc(random >= lower andalso random <= upper);
          loop(iter + 1, limit)
        )
      end
  in
    loop(0, 1000)
  end

implement main0 () = {
  val () = test_in_range_inclusive(1, 5)
  val () = test_in_range_inclusive(3, 5)
  val () = test_in_range_inclusive(1, 1)
}

