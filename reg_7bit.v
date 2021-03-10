module reg_7bit(inp,load,shifty,clk,rst,reg_inp);
    input [5:0] inp;
    input load,clk,rst,shifty;
    output reg[6:0] reg_inp;
    always @(posedge clk,posedge rst) begin
      if(rst) reg_inp <=7'b 0000000;
      else if (load) reg_inp <= {inp,1'b0};
      else if(shifty) reg_inp <={1'b0,reg_inp[6:1]};
    end
endmodule