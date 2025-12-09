// merge
module Black(A,B,C,D,GB,PB);
  input A,B,C,D;
  output GB,PB;
  wire s1 ;
  assign s1 = B & C;
  assign GB=s1 | A;
  assign PB=B & D;
endmodule
