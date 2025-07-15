module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);
    reg [3:0] one,ten,hundred,thousand;
    always@(posedge clk)begin
        if(reset)begin
            one <= 4'd0;
        end
        else if(one==9) one<=4'd0;
        else one<=one+1;
    end
    always@(posedge clk)begin
        if(reset)begin
            ten <= 4'd0;
        end
        else if(ten==4'd9&&one==4'd9) ten<=4'd0;
        else if(one==4'd9) begin
            ten <= ten+4'd1;
        end
    end
    always@(posedge clk)begin
        if(reset)begin
            hundred <= 4'd0;
        end
        else if(one==4'd9&&hundred==4'd9&&ten==4'd9) hundred <=4'd0;
        else if(ten==4'd9&&one==4'd9) hundred <= hundred+ 4'd1;
    end
    always@(posedge clk)begin
        if(reset)begin
            thousand <=4'd0;
        end
        else if(one==4'd9&&hundred==4'd9&&ten==4'd9&&thousand==4'd9) thousand<=4'd0;
        else if(hundred==4'd9&&ten==4'd9&&one==4'd9) thousand=thousand+4'd1;
    end
    assign q= {thousand,hundred, ten, one};
    assign ena[1] = (one==4'd9) ? 1:0;
    assign ena[2] = (one==4'd9&&ten==4'd9) ? 1:0;
    assign ena[3] = (one==4'd9&&hundred==4'd9&&ten==4'd9)?1:0;
endmodule
