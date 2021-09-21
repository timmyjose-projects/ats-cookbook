#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

staload UN = "prelude/SATS/unsafe.sats"

fun read_int(): int = 
  let
    macdef LINEMAX = 20
    var inp = @[char][LINEMAX]()
    val () = print!("Enter number: ")
    val bc = $extfcall(int, "scanf", "%s", addr@inp)
    val () = assertloc(bc != 0)
  in
    g0string2int($UN.cast{string}(addr@inp))
  end

implement main0 () = {
  val m = read_int()
  val () = println!("m = ", m)
  val n = read_int()
  val () = println!("n = ", n)

  val () = println!("sum = ", m + n)
  val () = println!("difference = ", m - n)
  val () = println!("product = ", m * n)
  val () = println!("quotient = ", m / n)
}

