module m2x1Mux(
  input a,
  input b,
  input select,
  output f,
  output g,
  output h);
  
  //pure tristate implementation
  bufif1 nb0(g, a, select);
  bufif0 nb1(g, b, select);
  
  //rtl implied tristate
  assign h = select ? a : b; //if select then a else b .. cryptic notation
  
endmodule
