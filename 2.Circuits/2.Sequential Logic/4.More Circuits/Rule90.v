module top_module(
    input clk,
    input load,
    input [511:0] data,
    output [511:0] q ); 
    integer i;
    reg [511:0] store;
    //assign q[-1] = 0;
    //assign q[512] =0;
    always@(*)begin
        for(i=0;i<512;i=i+1)begin
            if(i==511)begin
                store[i] = q[i-1]^0;
            end
            else if(i==0)begin
                store[i] = 0^q[i+1];
            end
            else begin
                store[i] = q[i-1]^q[i+1];
            end
        end
    end
    always@(posedge clk)begin
        if(load)begin
            q<=data;
        end
        else begin
            q<=store;
        end
    end
endmodule
