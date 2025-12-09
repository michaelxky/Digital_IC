// merge
module Black(Gh, Ph, Gl, Pl, GB, PB);
  input Gh, Ph, Gl, Pl;
  output GB, PB;

  wire s1;
  assign s1 = Ph & Gl;
  assign GB = s1 | Gh;
  assign PB = Ph & Pl;

endmodule

