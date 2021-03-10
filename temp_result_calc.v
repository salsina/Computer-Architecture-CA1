module temp_result_calc(clk,rst,ldresult,one_bit_mult_x,powercnt,init_result,temp_result);
    input clk,rst,init_result,ldresult;
    input[11:0] one_bit_mult_x ;
    input[5:0] powercnt;
    output reg [11:0] temp_result;
    always@(posedge clk,posedge rst)begin
      if(rst) temp_result <=12'b0;
      else if (init_result) temp_result <= 12'b0;
      else if (ldresult) begin
      $display("%d%d%d%d",one_bit_mult_x * powercnt,one_bit_mult_x,powercnt,temp_result);
        temp_result <= (temp_result + (one_bit_mult_x * powercnt));
      end
    end
endmodule