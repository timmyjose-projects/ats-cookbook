#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"
#include "share/HATS/atspre_staload_libats_ML.hats"

fun read_line_stream(): void = 
  let
    val lines = streamize_fileref_line(stdin_ref)
  in
    lines.foreach()(lam l => println!(l))
  end

implement main0 () = read_line_stream()
