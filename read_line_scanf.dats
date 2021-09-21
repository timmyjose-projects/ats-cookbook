#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

staload UN = "prelude/SATS/unsafe.sats"

fun read_line_scanf(): void =
  let
    macdef MAXLEN = 1024
    var str1 = @[uchar][MAXLEN]()
    var str2 = @[uchar][MAXLEN]()
  in
    {
      val () = println!("Enter name:");
      val bc = $extfcall(int, "scanf", "%s", addr@str1)
      val () =   assertloc(bc != 0)

      val () = println!("Enter city:");
      val bc = $extfcall(int, "scanf", "%s", addr@str2)
      val () =   assertloc(bc != 0)

      val str1 = $UN.cast{string}(addr@str1)
      val str2 = $UN.cast{string}(addr@str2)
      val () = println!("str1 = ", str1);
      val () = println!("str2 = ", str2)
    }
  end

implement main0 () = read_line_scanf()
