module top_module( 
    input [2:0] a, b,
    input cin,
    output [2:0] cout,
    output [2:0] sum );
    integer i;
    always @(*)begin
        for(i=0;i<3;i=i+1)begin
            if(i==0) begin
                sum[i] = a[i]^b[i]^cin;
                cout[i] = a[i]&b[i]|cin&b[i]|a[i]&cin;
            end
            else if (i!=0)begin
                sum[i] = a[i]^b[i]^cout[i-1];
                cout[i] = a[i]&b[i]|cout[i-1]&b[i]|a[i]&cout[i-1];
            end
        end
    end
                
            
            
            
endmodule