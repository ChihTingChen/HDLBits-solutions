module top_module (
    input clock,
    input a,
    output p,
    output q=1 );
    always@(*)begin
        if(clock)begin
            p=a;
        end
    end
    
    always@(negedge clock)begin
        q<=p;
    end
    
endmodule
