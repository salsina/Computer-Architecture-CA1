module x_status_setter(xreg,negate_xreg,yreg,en_mult_one_bit_y,one_bit_mult_x);
    input [11:0] xreg,negate_xreg;
    input [6:0 ] yreg;
    input en_mult_one_bit_y;
    output reg[11:0] one_bit_mult_x;
    always @(posedge en_mult_one_bit_y)begin
      if(yreg[1:0] == 2'b 00 || yreg[1:0] == 2'b 11)
        one_bit_mult_x = 12'b0;
        else if(yreg[1:0] == 2'b01)
            one_bit_mult_x = xreg;
        else if(yreg[1:0] == 2'b10)
            one_bit_mult_x = negate_xreg;
    end
endmodule