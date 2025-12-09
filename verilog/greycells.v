// feedthrough
module Grey(A,B,C,GG);
  input A,B,C;
  output GG;
  wire s1 ;
  assign s1 = B & C;
  assign GG=s1 | A;
endmodule
