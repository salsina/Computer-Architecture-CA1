module controller(clk,rst,carryout,start,ldx,ldy,shifty,initcnt,encnt,en_mult_one_bit_y,init_result,ldresult,done);
    input clk,rst,start,carryout;
    output reg ldx,ldy,shifty,initcnt,encnt,en_mult_one_bit_y,init_result,ldresult,done;
    parameter[2:0] idle = 3'b000,starting = 3'b001,loading = 3'b010,enmulty = 3'b011,loadresult = 3'b100,Done = 3'b101;
    reg [2:0] ps,ns;
    always@(posedge clk,posedge rst)begin
      if(rst) begin
            ps <= 3'b000;
        end
      else ps<=ns;
    end

    always@(ps,start)begin
    case(ps)
        idle:ns = start ? starting : idle;
        starting:ns = loading;
        loading:ns = enmulty;
        enmulty:ns = 3'b100;
        loadresult:ns = (carryout==1) ? done : enmulty;
        Done:ns = start ? Done:idle;
    endcase
    end

    always@(ps)begin
    {done,en_mult_one_bit_y ,encnt,shifty,ldx,ldy,ldresult,init_result,initcnt} = 9'b0;
    case(ps)    
        idle: ;
        starting: {initcnt,init_result} =2'b 11;
        loading: {ldx,ldy} = 2'b 11;
        enmulty: en_mult_one_bit_y = 1;
        loadresult: {shifty, encnt, ldresult} = 3'b 111;
        Done: done = 1'b1; 
    endcase
    end
endmodule