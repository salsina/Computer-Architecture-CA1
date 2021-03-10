module reg_6bit(inp,load,clk,rst,reg_inp);
    input [5:0] inp;
    input load,clk,rst;
    output reg [11:0] reg_inp;
    always @(posedge clk,posedge rst) begin
      if(rst) reg_inp <=12'b 0;
      else if (load) begin
        if (inp[5] == 1'b0) reg_inp <= {6'b0,inp};
        else  reg_inp <= {6'b111111,inp};
      end
    end
endmodule