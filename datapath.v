module datapath(x,y,ldx,ldy,shifty,clk,rst,initcnt,encnt,en_mult_one_bit_y,init_result,ldresult,result,carryout);
    input [5:0] x,y;
    input ldx,ldy,shifty,clk,rst,initcnt,encnt,en_mult_one_bit_y,init_result,ldresult;
    output wire [11:0] result;
    wire [11:0] one_bit_mult_x;
    wire [11:0] x_reg;
    wire [11:0] negate_xreg;
    wire [6:0] powercnt;
    wire [2:0] cntr;
    wire [6:0] y_reg;
    wire [11:0] temp_result;
    output wire carryout;

    reg_6bit reg_1(x,ldx,clk,rst,x_reg);
    reg_6bit_neg reg_2(x,ldx,clk,rst,negate_xreg);
    reg_7bit reg_3(y,ldy,shifty,clk,rst,y_reg);

    counter counter_1(clk,rst,initcnt,encnt,cntr,carryout,powercnt);
    
    x_status_setter xss(x_reg,negate_xreg,y_reg,en_mult_one_bit_y,one_bit_mult_x);

    temp_result_calc trc(clk,rst,ldresult,one_bit_mult_x,powercnt,init_result,temp_result);

    assign result = temp_result;

endmodule