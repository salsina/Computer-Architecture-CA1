module counter(clk,rst,initcnt,encnt,cntr,carryout,powercnt);
    input clk,rst,initcnt,encnt;
    output reg [2:0]cntr;
    output reg carryout;
    output reg[6:0] powercnt;
    always@(posedge clk,posedge rst) begin
        if(rst) begin
            cntr <=3'b 000;
            carryout <= 3'b000;
            powercnt <=7'b 0000001;
        end
        else if(initcnt)begin
            cntr <= 3'b 000;
            carryout <= 3'b000;
            powercnt <= 7'b 0000001;
        end
        else if(encnt)begin
            cntr <= cntr + 1;
            carryout <= cntr == 3'b 111 ? 1 : 0;
            powercnt <= {powercnt[5:0],1'b0};
        end
    end
endmodule