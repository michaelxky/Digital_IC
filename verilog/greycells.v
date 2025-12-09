// feedthrough
module Grey(Gh,Ph,Gl,GG);
  input Gh,Ph,Gl;
  output GG;
  wire s1 ;
  assign s1 = Ph & Gl;
  assign GG=s1 | Gh;
endmodule
