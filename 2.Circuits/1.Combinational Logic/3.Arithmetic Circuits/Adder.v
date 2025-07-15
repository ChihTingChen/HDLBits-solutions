module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);
	integer i;
    reg [3:0] carry;
    always@(*)begin
        for(i=0;i<4;i=i+1)begin
            if(i==0)begin
                sum[i] = x[i]^y[i];
                carry[i] = x[i]&y[i];
            end
            else if(i!=0)begin
                sum[i] = x[i]^y[i]^carry[i-1];
                carry[i] = (x[i]&y[i])|(carry[i-1]&y[i])|(x[i]&carry[i-1]);
            end
        end
        sum[4] = (x[3]&y[3])|(carry[2]&y[3])|(x[3]&carry[2]);
    end
endmodule
