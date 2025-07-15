module top_module( 
    input [99:0] a, b,
    input cin,
    output cout,
    output [99:0] sum );
    integer i;
    reg carry[99:0];
    always@(*)begin
        for(i=0;i<100;i=i+1)begin
            if(i==0) begin
                sum[i] = a[i]^b[i]^cin;
                carry[i] = (a[i]&b[i])|(cin&b[i])|(a[i]&cin);
            end
            else begin
                sum[i] = a[i]^b[i]^carry[i-1];
                carry[i] = (a[i]&b[i])|(carry[i-1]&b[i])|(a[i]&carry[i-1]);
            end
        end
        cout = carry[99];
    end
                
                
        
endmodule
